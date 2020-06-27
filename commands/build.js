const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const sshSync = require('../lib/ssh');

exports.command = 'build <jobName>';
exports.desc = 'Build a specified job';
exports.builder = yargs => {
	yargs.options({
		jobName: {
			describe: "The target job name that should be built",
			type: 'string'
		},
		username: {
			alias: 'u',
			describe: 'Jenkins user',
			type: 'string',
			default: 'admin'
		},
		password: {
			alias: 'p',
			describe: 'Jenkins password',
			type: 'string',
			default: 'admin'
		},
		url: {
			alias: 'l',
			describe: 'Jenkins URL',
			type: 'string',
			default: '192.168.33.20:9000'
		}
	});
};


exports.handler = async argv => {
    const { jobName, username, password, url } = argv;

    (async () => {
        run(jobName, username, password, url);
    })();

};

async function run(jobName, username, password, url) {
    console.log(chalk.blueBright(`You are going to build job iTrust`));
    let result = sshSync(`/bakerx/cm/run-jenkins-job.sh ${jobName}`, 'vagrant@192.168.33.20');
    if( result.error ) { process.exit( result.status ); }
	var jenkins = require('jenkins')({ baseUrl: `http://${username}:${password}@${url}`, crumbIssuer: true });
	jenkins.job.build({ name: jobName, token: 'token' }, function(err, id) {
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
		var log = jenkins.build.logStream(jobName, 'lastBuild');
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
