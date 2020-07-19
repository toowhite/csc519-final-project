const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const os = require('os');
let fs = require('fs');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

exports.command = 'deploy <server>';
exports.desc = 'deploy to production server';
exports.builder = yargs => {
    yargs.options({
        server: {
            describe: 'name of server to deploy',
            type: 'string',
            // demandOption: true
        },
        inventory: {
            describe: 'Prod resources config file',
            type: 'string',
            alias: 'i',
            demandOption: true
        }
    });
};


exports.handler = async argv => {
    const { server, inventory } = argv;

    await (async () => {

        await run(server, inventory);

    })();

};

async function run(server, inventory) {
    let config = await fs.readFileSync(`cm/${inventory}`, {encoding:'utf8', flag:'r'});
    let cloudResources = config.split("\n\n");

    let ipAddress;
    let ansiblePrivateKeyPath;
    let ansibleUser;
    for (i in cloudResources) {
        let cloudResource = cloudResources[i];
        if (cloudResource.includes(server)) {
            let resources = cloudResource.replace( /\n/g, " " ).split( " " );
            ipAddress = resources[1].trim();
            ansiblePrivateKeyPath = resources[2].trim().replace("ansible_ssh_private_key_file=", "");
            ansibleUser = resources[3].trim().replace("ansible_user=", "");
        }
    }

    console.log(chalk.greenBright(`deploying ${server}...`));

    if (ansiblePrivateKeyPath.startsWith("~"))
        ansiblePrivateKeyPath = ansiblePrivateKeyPath.replace("~", os.homedir());

    console.log(chalk.blueBright(`Installing ansiblePrivateKey on ${server} server`));
    let identifyFile = ansiblePrivateKeyPath || path.join(os.homedir(), '.bakerx', 'insecure_private_key');
    result = scpSync (identifyFile, `${ansibleUser}@${ipAddress}:/home/vagrant/.ssh/mm_rsa`);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright(`Running deploy playbook on config server for ${server}...`));
    result = sshSync(`ansible-playbook /bakerx/cm/${server}-deploy.yml --vault-password-file=/home/vagrant/.vault-pass -i /bakerx/cm/${inventory}`, `${ansibleUser}@192.168.33.20`);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }
}
