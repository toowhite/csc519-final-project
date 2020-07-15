const chalk = require('chalk');
const path = require('path');
const os = require('os');
const air = require('ansible-inventory-reader');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

exports.command = 'monitor-setup';
exports.desc = 'Setup monitoring infrastructure on given infrastructure';
exports.builder = yargs => {
    yargs.options({
        inventoryFile: {
            describe: 'Inventory file',
            type: 'string',
            alias: 'i',
            default: 'inventory.ini'
        }
    });
};


exports.handler = async (argv) => {
    const {inventoryFile} = argv;
    (async () => {
        await run(inventoryFile);
    })();
};

async function run(inventoryFile) {
    
    let config = air(inventoryFile);
    setupMonitor(config);
    setupAgents(config);
}

function setupMonitor(config) {
    let monitorIp = config.monitor.children[0].host;

    console.log(chalk.blueBright('Installing privateKey on jenkins server'));
    let identifyFile = path.join(os.homedir(), '.ssh', 'id_rsa');
    result = scpSync (identifyFile, `root@${monitorIp}:/root/.ssh/id_rsa`);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Copying over vault password file to jenkins server'));
    let vaultPasswordFile = path.join(os.homedir(), '.ansible', '.vault-pass');
    result = scpSync (vaultPasswordFile, `root@${monitorIp}:/root/.vault-pass`);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Copying init scripts...'));
    result = scpSync("./cm", `root@${monitorIp}:/root/cm`, identifyFile, true);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }
}

function setupAgents(config) {
    
} 