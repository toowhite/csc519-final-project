const chalk = require('chalk');
const path = require('path');
const os = require('os');
const air = require('ansible-inventory-reader');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

let identifyFile = path.join(os.homedir(), '.ssh', 'id_rsa');

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

    console.log(chalk.blueBright('Installing privateKey on monitor server'));
    result = scpSync (identifyFile, `root@${monitorIp}:/root/.ssh/id_rsa`, identifyFile);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    // console.log(chalk.blueBright('Copying over vault password file to monitor server'));
    // let vaultPasswordFile = path.join(os.homedir(), '.ansible', '.vault-pass');
    // result = scpSync (vaultPasswordFile, `root@${monitorIp}:/root/.vault-pass`, identifyFile);
    // if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Copying init scripts...'));
    result = scpSync("./cm", `root@${monitorIp}:/root`, identifyFile, true);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }
    result = scpSync("./monitoring_tools", `root@${monitorIp}:/root`, identifyFile, true);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Running init script...'));
    result = sshSync(`"chmod +x /root/cm/*.sh && /root/cm/monitor-server-init.sh"`, `root@${monitorIp}`, identifyFile);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

}

function setupAgents(config) {
    
} 