const fs = require('fs'),
    xml2js = require('xml2js'),
    child  = require('child_process'); 
const parser = new xml2js.Parser();
const Bluebird = require('bluebird');

function mutate() {
    // TODO
}

function rebuild() {
    _build();
    test();
}

function source() {
    let gh_user = encodeURIComponent(process.env.GH_USER);
    let gh_pass = encodeURIComponent(process.env.GH_PASS);
    let getSourceCodeCommands = [
        `cd ${process.env.HOME}`,
        'rm -rf iTrust2-v6',
        `git clone https://${gh_user}:${gh_pass}@github.ncsu.edu/engr-csc326-staff/iTrust2-v6.git`
    ];
    child.spawnSync(getSourceCodeCommands.join(" && "), {stdio: "inherit", shell: true});
}

function config() {
    let modifyPropertyFilesCommands = [
        `cd ${projectFolder}/src/main/java`,
        "cp db.properties.template db.properties",
        'sed -i "s/^password.*\$/password $mysql_root_password/" db.properties',
        "cp email.properties.template email.properties",
        'sed -i "s/^from.*\$/from csc519-1d02a0@inbox.mailtrap.io/" email.properties',
        'sed -i "s/^username.*\$/username $smtp_username/" email.properties',
        'sed -i "s/^password.*\$/password $smtp_password/" email.properties',
        'sed -i "s/^host.*\$/host smtp.mailtrap.io/" email.properties'
    ];
    child.spawnSync(modifyPropertyFilesCommands.join(" && "), {stdio: "inherit", shell: true});
}

function _build() {
    console.debug("Start building...");
    let buildCommands = [
        `cd ${projectFolder}`,
        "mvn clean process-test-classes -f pom-data.xml",
    ];
    let result = child.spawnSync(buildCommands.join(" && "), {stdio: "pipe", shell: true});
    if (result.status == 0) {
        console.info("Build successfully.");
    }
    else {
        console.error(result.error);
    }
    fs.writeFileSync("build_stdout.log", result.stdout, {flag: "w"});
    fs.writeFileSync("build_stderr.log", result.stderr, {flag: "w"});
}

function test() {
    console.debug("Start testing...");
    let testCommands = [
        `cd ${projectFolder}`,
        "mvn clean test verify org.apache.maven.plugins:maven-checkstyle-plugin:3.1.0:checkstyle"
    ];
    let result = child.spawnSync(testCommands.join(" && "), {stdio: "pipe", shell: true});
    if (result.status == 0) {
        console.info("Test successfully.");
    }
    else {
        console.error(result.error);
    }
    fs.writeFileSync("test_stdout.log", result.stdout, {flag: "w"});
    fs.writeFileSync("test_stderr.log", result.stderr, {flag: "w"});
}

function readResults(result)
{
    let tests = [];
    for( let i = 0; i < result.testsuite['$'].tests; i++ )
    {
        let testcase = result.testsuite.testcase[i];
        
        tests.push({
        name:   testcase['$'].name, 
        time:   testcase['$'].time, 
        status: testcase.hasOwnProperty('failure') ? "failed": "passed"
        });
    }    
    return tests;
}

async function calculatePriority(testReport)
{
    let contents = fs.readFileSync(testReport)
    let xml2json = await Bluebird.fromCallback(cb => parser.parseString(contents, cb));
    let tests = readResults(xml2json);
    tests.forEach( e => console.log(e));

    return tests;
}

function reset() {
    let commands = [
        `cd ${projectFolder}/..`,
        "git reset --hard"
    ];

    child.spawnSync(commands.join(" && "), {stdio: "inherit", shell: true});
}

async function gatherResults() {
    let testFolder = projectFolder + "/target/surefire-reports";
    let testReport =  testFolder + "/TEST-edu.ncsu.csc.itrust2.apitest.APIAppointmentRequestTest.xml";
    await calculatePriority(testReport);
}

const projectFolder = `${process.env.HOME}/iTrust2-v6/iTrust2`;
if (process.argv.length < 3) {
    throw new Error("Insufficient arguments");
}
const noOfMutations = process.argv[2];


(async () => {
    source();
    for (let i = 0; i < noOfMutations; i++) {
        config();
        mutate();
        rebuild();
        await gatherResults();
        reset();
    }
    console.log("Mission completes.");
})();



// module.exports.calculatePriority = calculatePriority;