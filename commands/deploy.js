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
    const {server, inventory} = argv;

    await (async () => {

        await run(server, inventory);

    })();

};

async function run(server, inventory) {
    let config = await fs.readFileSync(`cm/${inventory}`, {encoding: 'utf8', flag: 'r'});
    let cloudResources = config.split("\n\n");

    let serverConfig;
    if (server === "checkbox.io")
        serverConfig = "checkbox";
    else if (server === "iTrust")
        serverConfig = "itrust";
    else {
        console.log("\n invalid server name.. \n");
        process.exit(1);
    }

    let ipAddress;
    let ansiblePrivateKeyPath;
    let ansibleUser;
    for (i in cloudResources) {
        let cloudResource = cloudResources[i];
        if (cloudResource.includes(serverConfig)) {
            let resources = cloudResource.replace(/\n/g, " ").split(" ");
            ipAddress = resources[1].trim();
            ansiblePrivateKeyPath = resources[2].trim().replace("ansible_ssh_private_key_file=", "");
            ansibleUser = resources[3].trim().replace("ansible_user=", "");
        }
    }

    console.log(chalk.greenBright(`deploying ${server}...`));

    let wrappedKeyPath = `\"${ansiblePrivateKeyPath}\"`

    console.log(chalk.blueBright(`Running deploy playbook on config server for ${server}...`));
    result = sshSync(`/bakerx/cm/${server}-deploy.sh /bakerx/cm/${inventory} ${ipAddress} ${ansibleUser} ${wrappedKeyPath}`, `vagrant@192.168.33.20`);
    if (result.error) {console.log(result.error);process.exit(result.status);}
}
