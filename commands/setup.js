const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const os = require('os');
const fs = require('fs');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

exports.command = 'setup';
exports.desc = 'Provision and configure the configuration server';
exports.builder = yargs => {
    yargs.options({
        privateKey: {
            describe: 'Install the provided private key on the configuration server',
            type: 'string'
        },
		ghuser: {
			alias: 'gh-user',
			describe: 'github user',
            type: 'string',
            demandOption: true
		},
		ghpass: {
			alias: 'gh-pass',
			describe: 'github password',
            type: 'string',
            demandOption: true
		}
    });
};


exports.handler = async argv => {
    const { privateKey, ghuser, ghpass } = argv;

    (async () => {

        await run( privateKey, ghuser, ghpass );

    })();

};

async function run(privateKey, ghuser, ghpass) {
    console.log(chalk.blueBright('Provisioning config server...'));
    let result = child.spawnSync(`bakerx`, `run config-srv bionic --ip 192.168.33.20 --sync -m 4096`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error || result.status != 0 ) { console.log(`Error code: ${result.status}`); console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Installing bakerx private key on config server'));
    let localIdentifyFile = privateKey || path.join(os.homedir(), '.bakerx', 'insecure_private_key');
    result = scpSync (localIdentifyFile, 'vagrant@192.168.33.20:/home/vagrant/.ssh/mm_rsa');
    if( result.error || result.status != 0 ) { console.log(`Error code: ${result.status}`); console.log(result.error); process.exit( result.status ); }

    let doIdentifyFile = path.join(os.homedir(), '.ssh', 'id_rsa');
    if (fs.existsSync(doIdentifyFile)) {
        console.log(chalk.blueBright('Installing DigitalOcean private key on config server'));
        result = scpSync(doIdentifyFile, 'vagrant@192.168.33.20:/home/vagrant/.ssh/id_rsa');
        if( result.error || result.status != 0 ) { console.log(`Error code: ${result.status}`); console.log(result.error); process.exit( result.status ); }
    }

    console.log(chalk.blueBright('Copying over vault password file to config server'));
    let vaultPasswordFile = path.join(os.homedir(), '.ansible', '.vault-pass');
    result = scpSync (vaultPasswordFile, 'vagrant@192.168.33.20:/home/vagrant/.vault-pass');
    if( result.error || result.status != 0 ) { console.log(`Error code: ${result.status}`); console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Running init script...'));
    result = sshSync(`/bakerx/cm/server-init.sh ${ghuser} ${ghpass}`, 'vagrant@192.168.33.20');
    if( result.error || result.status != 0 ) { console.log(`Error code: ${result.status}`); console.log(result.error); process.exit( result.status ); }
    
    console.log(chalk.blueBright("Setup completes. Open jenkins at http://192.168.33.20:9000"));
}
