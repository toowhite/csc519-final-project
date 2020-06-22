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
	var jenkins = require('jenkins')({ baseUrl: 'http://admin:admin@192.168.33.20:9000', crumbIssuer: true });
	jenkins.job.build({ name: 'checkbox.io', token: 'token' }, function(err, id) {
		if (err) throw err;
		waitOnQueue(id);
    });
	
	function waitOnQueue(id) {
		jenkins.queue.item(id, function(err, item) {
		if (err) throw err;
		if (item.executable) {
			console.log('number:', item.executable.number);
			logstream();
	
		} else if (item.cancelled) {
			console.log('cancelled');
		} else {
			setTimeout(function() {
			waitOnQueue(id);
			}, 500);
		}
		});
	}


	function logstream() {
		var log = jenkins.build.logStream('checkbox.io', 'lastBuild');
		log.on('data', function(text) {
			process.stdout.write(text);
		});
 
		log.on('error', function(err) {
			console.log('error', err);
		});
 
		log.on('end', function() {
			console.log('end');
		});
	}
}
