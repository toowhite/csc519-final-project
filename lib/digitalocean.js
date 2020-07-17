const got = require("got");
const chalk = require('chalk');

class DigitalOceanProvider {
	async createDroplet(dropletName, region = "nyc1", imageName = "ubuntu-18-04-x64") {
		let config = {};
		// Retrieve our api token from the environment variables.
		config.token = process.env.NCSU_DOTOKEN;
		config.ssh_key = process.env.NCSU_SSH_KEY;

		if (!config.token || !config.ssh_key) {
			console.log(chalk`{red.bold NCSU_DOTOKEN or NCSU_SSH_KEY is not defined!}`);
			console.log(`Please set your environment variables with appropriate token.`);
			console.log(chalk`{italic You may need to refresh your shell in order for your changes to take place.}`);
			process.exit(1);
		}

		console.log(chalk.green(`Your token is: ${config.token.substring(0, 4)}...`));

		// Configure our headers to use our token when making REST api requests.
		const headers =
		{
			'Content-Type': 'application/json',
			Authorization: 'Bearer ' + config.token
		};


		if (dropletName == "" || region == "" || imageName == "") {
			console.log(chalk.red("You must provide non-empty parameters for createDroplet!"));
			return;
		}

		let data =
		{
			"name": dropletName,
			"region": region,
			"size": "s-1vcpu-1gb",
			"image": imageName,
			"ssh_keys": [config.ssh_key],
			"backups": false,
			"ipv6": false,
			"user_data": null,
			"private_networking": null
		};

		console.log("Attempting to create: " + JSON.stringify(data));

		let response = await got.post("https://api.digitalocean.com/v2/droplets",
			{
				headers: headers,
				json: data
			}).catch(err =>
				console.error(chalk.red(`createDroplet: ${err}`))
			);

		if (!response || response.statusCode != 202) return;

		let body = JSON.parse(response.body);
		console.log(chalk.green(`Created droplet id ${body.droplet.id}`));

		return body.droplet;
	}

	async dropletInfo(id) {
		return new Promise(async (resolve, reject) => {
			let response = await got.get(`https://api.digitalocean.com/v2/droplets/${id}`,
				{
					headers: headers
				}).catch(err =>
					console.error(chalk.red(`dropletInfo: ${err}`))
				);

			if (!response) return;

			let body = JSON.parse(response.body);
			if (body.droplet && body.droplet.networks.v4[0].ip_address) {
				// console.log(chalk.green(`Ip address is ${body.droplet.networks.v4[0].ip_address}`));
				resolve(body.droplet.networks.v4[0].ip_address);
			}
			else {
				reject("Ip address has not been set!");
			}
		});
	}

};

/*
async function provision() {
	let client = new DigitalOceanProvider();
	let name = "zli58" + os.hostname();
	let region = "nyc1"; // Fill one in from #1
	let image = "centos-7-x64"; // Fill one in from #2
	let dropletId = await client.createDroplet(name, region, image);

	let timerId = setInterval(() => {
		client.dropletInfo(dropletId);
	}, 5000);
}
*/

module.exports = new DigitalOceanProvider();