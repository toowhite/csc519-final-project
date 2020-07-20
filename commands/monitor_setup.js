const chalk = require('chalk');
const os = require('os');
const path = require('path');

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
    console.log(chalk.blueBright('Running init script...'));
    result = sshSync(`/bakerx/cm/monitor-server-init.sh ${inventoryFile}`, 'vagrant@192.168.33.20');
    if (result.error) { console.log(result.error); process.exit(result.status); }

}