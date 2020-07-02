const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const os = require('os');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

exports.command = 'useful-tests';
exports.desc = 'Output list of tests, ordered from most useful to least useful, based on the number of times the test has detected a failed build.';
exports.builder = yargs => {
    yargs.options({
		no_of_mutations: {
			alias: 'c',
			describe: 'Run -c numbers of times',
            type: 'int',
            default: 100
		},
    });
};


exports.handler = async argv => {
    const { no_of_mutations } = argv;

    (async () => {

        await run( no_of_mutations );

    })();

};

async function run(no_of_mutations) {
    console.log(chalk.greenBright(`Run ${no_of_mutations} times (mutations)...`));
    let result = sshSync(`/bakerx/cm/call-detector.sh ${no_of_mutations}`, 'vagrant@192.168.33.20');
    if( result.error ) { console.log(result.error); process.exit( result.status ); }
}
