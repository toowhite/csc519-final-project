const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const sshSync = require('../lib/ssh');


exports.command = 'build <jobName>';
exports.desc = 'Build a specified job';
exports.builder = yargs => {
    yargs.options({
    });
};


exports.handler = async argv => {
    const { jobName } = argv;

    (async () => {
        run(jobName);
    })();

};

async function run(jobName) {
    console.log(chalk.blueBright(`You are going to build job ${jobName}`));
    let result = sshSync(`/bakerx/cm/run-jenkins-job.sh ${jobName}`, 'vagrant@192.168.33.20');
    if( result.error ) { process.exit( result.status ); }

}
