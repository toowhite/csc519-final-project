const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const os = require('os');

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
    console.log(chalk.greenBright('Installing jenkins server!'));

    console.log(chalk.blueBright('Provisioning jenkins server...'));
    let result = child.spawnSync(`bakerx`, `run config-srv bionic --ip 192.168.33.20 --sync -m 4096`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    setTimeout(() => {
        console.log(chalk.blueBright('Installing local env private key on jenkins server'));
        let localIdentifyFile = privateKey || path.join(os.homedir(), '.bakerx', 'insecure_private_key');
        result = scpSync (localIdentifyFile, 'vagrant@192.168.33.20:/home/vagrant/.ssh/mm_rsa');
        if( result.error ) { console.log(result.error); process.exit( result.status ); }
    
        console.log(chalk.blueBright('Installing DigitalOcean env private key on jenkins server'));
        let doIdentifyFile = path.join(os.homedir(), '.ssh', 'id_rsa');
        result = scpSync(doIdentifyFile, 'vagrant@192.168.33.20:/home/vagrant/.ssh/id_rsa');
        if( result.error ) { console.log(result.error); process.exit( result.status ); }
    
        console.log(chalk.blueBright('copying over vault password file to jenkins server'));
        let vaultPasswordFile = path.join(os.homedir(), '.ansible', '.vault-pass');
        result = scpSync (vaultPasswordFile, 'vagrant@192.168.33.20:/home/vagrant/.vault-pass');
        if( result.error ) { console.log(result.error); process.exit( result.status ); }
    
        console.log(chalk.blueBright('Running init script...'));
        result = sshSync(`/bakerx/cm/server-init.sh ${ghuser} ${ghpass}`, 'vagrant@192.168.33.20');
        if( result.error ) { console.log(result.error); process.exit( result.status ); }
        
        console.log(chalk.blueBright("Setup completes. Open jenkins at http://192.168.33.20:9000"));
    }, 5000);
}
