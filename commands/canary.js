const chalk = require('chalk');
const child = require('child_process');
const path = require('path');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

exports.command = 'canary master broken';
exports.desc = 'Construct canary infrastructure, collect data, and perform analysis on the given branches';
exports.builder = yargs => {
    yargs.options({
    });
};


exports.handler = async (argv) => {
    const {} = argv;
    (async () => {
        await run();
    })();
};

const MASTER_IP = "192.168.33.30";
const BROKEN_IP = "192.168.33.31";
const PROXY_IP = "192.168.33.32";

async function run() {
    console.log(chalk.blueBright('Provisioning needed servers...'));
    let result = child.spawnSync(`bakerx`, `run master bionic --ip ${MASTER_IP} --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    result = child.spawnSync(`bakerx`, `run broken bionic --ip ${BROKEN_IP} --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    result = child.spawnSync(`bakerx`, `run proxy bionic --ip ${PROXY_IP} --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Running init script...'));
    result = sshSync(`/bakerx/cm/run-ansible.sh canary-setup.yml inventory.canary.ini`, 'vagrant@192.168.33.20');
    if (result.error) { console.log(result.error); process.exit(result.status); }

    console.log(chalk.redBright('Be patient. It takes more than 2 minutes to generate the report.'));
    setTimeout(() => {
        console.log(chalk.blueBright('Try getting test result...'));
        result = sshSync(`sudo cat /bakerx/Monitoring/dashboard/result.txt`, `vagrant@${PROXY_IP}`);
        if (result.error) { console.log(result.error); process.exit(result.status); }
    
    }, (60 + 60 + 5) * 1000);
}