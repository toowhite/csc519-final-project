const chalk = require('chalk');
const digo = require('../lib/digitalocean');
const fs = require('fs');
const { exit } = require('process');

exports.command = 'prod up';
exports.desc = 'Provision cloud instances';


exports.handler = async () => {
    (async () => {
        await run();
    })();
};

async function run() {

    let inventoryDesc = [];

    let monitor = await digo.createDroplet("monitor");
    console.log(chalk.blueBright("Monitor droplet created!"));
    // console.log(monitor);

    let itrust = await digo.createDroplet("itrust");
    console.log(chalk.blueBright("itrust droplet created!"));
    // console.log(itrust);

    let checkbox = await digo.createDroplet("checkbox");
    console.log(chalk.blueBright("checkbox droplet created!"));
    // console.log(checkbox);

    console.log("Waiting IP addresses to be ready...");
    setInterval(async () => {
        try {
            let ip;
            ip = await digo.dropletInfo(monitor.id);
            inventoryDesc.push("[monitor]");
            inventoryDesc.push(`${ip} ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_user=root\n`);

            ip = await digo.dropletInfo(itrust.id);
            inventoryDesc.push("[itrust]");
            inventoryDesc.push(`${ip} ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_user=root\n`);

            ip = await digo.dropletInfo(checkbox.id);
            inventoryDesc.push("[checkbox]");
            inventoryDesc.push(`${ip} ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_user=root\n`);

            let content = inventoryDesc.join("\n");
            fs.writeFileSync("cm/inventory.ini", content);
            console.log(chalk.blueBright("Inventory file created successfully!"));

            console.log(content);

            exit(0);
        }
        catch(err) {
            console.error(err);
            console.log(chalk.green("Don't worry, will try again 5 seconds later until succeed."));
            inventoryDesc = [];
        }
    }, 5000);
}
