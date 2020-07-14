const chalk = require('chalk');
const path = require('path');
const os = require('os');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');
const digo = require('../lib/digitalocean');

exports.command = 'prod up';
exports.desc = 'Provision cloud instances';


exports.handler = async () => {
    (async () => {
        await run();
    })();
};

async function run() {
    digo.provision();
}
