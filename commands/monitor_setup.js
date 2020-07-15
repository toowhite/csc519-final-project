const chalk = require('chalk');
const fs = require('fs');
const { alias } = require('yargs');

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
    console.log(inventoryFile);
}
