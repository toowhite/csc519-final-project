const got = require("got");
const chalk = require('chalk');
const os = require('os');

let config = {};
// Retrieve our api token from the environment variables.
config.token = process.env.NCSU_DOTOKEN;

if (!config.token) {
	console.log(chalk`{red.bold NCSU_DOTOKEN is not defined!}`);
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


class DigitalOceanProvider {

	async createDroplet(dropletName, region, imageName) {
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
			"ssh_keys": ["3b:0b:94:2e:c9:ea:5d:6c:a7:a7:8e:80:5b:2d:c8:b9"],
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
        
        return body.droplet.id;
	}

	async dropletInfo(id) {
		let response = await got.get(`https://api.digitalocean.com/v2/droplets/${id}`, 
			{
				headers: headers
			}).catch(err =>
				console.error(chalk.red(`dropletInfo: ${err}`))
			);

		if (!response) return;
		
		let body = JSON.parse(response.body);
		if (body.droplet && body.droplet.networks.v4[0].ip_address) {
			console.log(chalk.green(`Ip address is ${body.droplet.networks.v4[0].ip_address}`));
		}

	}

};


async function provision() {
	let client = new DigitalOceanProvider();
	let name = "zli58"+os.hostname();
	let region = "nyc1"; // Fill one in from #1
	let image = "centos-7-x64"; // Fill one in from #2
	let dropletId = await client.createDroplet(name, region, image);

	let timerId = setInterval(() => {
		client.dropletInfo(dropletId);
	}, 5000);
}


module.exports.provision = provision;