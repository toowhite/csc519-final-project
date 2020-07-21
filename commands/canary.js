const chalk = require('chalk');
const child = require('child_process');
const path = require('path');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

exports.command = 'canary <master> <broken>';
exports.desc = 'Construct canary infrastructure, collect data, and perform analysis on the given branches';
exports.builder = yargs => {
    yargs.options({
        master: {
            type: 'string',
            demandOption: true
		},
		broken: {
            type: 'string',
            demandOption: true
		}
    });
};


exports.handler = async (argv) => {
    const {master, broken} = argv;
    (async () => {
        await run(master, broken);
    })();
};

let MASTER_IP = "192.168.33.30";
let BROKEN_IP = "192.168.33.31";
let CANARY_IP = "192.168.33.32";

async function run(master, broken) {
    console.log(chalk.blueBright('Provisioning needed servers...'));
    let result = child.spawnSync(`bakerx`, `run ${master} bionic --ip ${MASTER_IP} --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    result = child.spawnSync(`bakerx`, `run ${broken} bionic --ip ${BROKEN_IP} --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    result = child.spawnSync(`bakerx`, `run proxy bionic --ip ${CANARY_IP} --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Running init script...'));
    result = sshSync(`/bakerx/cm/run-ansible.sh canary-setup.yml inventory.canary.ini`, 'vagrant@192.168.33.20');
    if (result.error) { console.log(result.error); process.exit(result.status); }
}