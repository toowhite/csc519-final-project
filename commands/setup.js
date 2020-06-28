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
			default: 'admin'
		},
		ghpass: {
			alias: 'gh-pass',
			describe: 'gitub password',
			type: 'string',
			default: 'admin'
		}
    });
};


exports.handler = async argv => {
    const { privateKey } = argv;

    (async () => {

        await run( privateKey );

    })();

};

async function run(privateKey, ghuser, ghpass) {
	process.env['GHUSER'] = ghuser;
	process.env['GHPASS'] = ghpass;
    console.log(chalk.greenBright('Installing jenkins server!'));

    console.log(chalk.blueBright('Provisioning jenkins server...'));
    let result = child.spawnSync(`bakerx`, `run config-srv bionic --ip 192.168.33.20 --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Installing privateKey on jenkins server'));
    let identifyFile = privateKey || path.join(os.homedir(), '.bakerx', 'insecure_private_key');
    result = scpSync (identifyFile, 'vagrant@192.168.33.20:/home/vagrant/.ssh/mm_rsa');
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('copying over vault password file to jenkins server'));
    let vaultPasswordFile = path.join(os.homedir(), '.ansible', '.vault-pass');
    result = scpSync (vaultPasswordFile, 'vagrant@192.168.33.20:/home/vagrant/.vault-pass');
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Running init script...'));
    result = sshSync('/bakerx/cm/server-init.sh', 'vagrant@192.168.33.20');
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright("Setup completes. Open jenkins at http://192.168.33.20:9000"));

}
