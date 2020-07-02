var fs = require('fs'),
    xml2js = require('xml2js'),
    child  = require('child_process'); 
var parser = new xml2js.Parser();
var Bluebird = require('bluebird')

var projectFolder = `${process.env.HOME}/iTrust2-v6/iTrust2`;
var testFolder = projectFolder + "/target/surefire-reports";
var testReport =  testFolder + "/TEST-edu.ncsu.csc.itrust2.apitest.APIAppointmentRequestTest.xml";

if( process.env.NODE_ENV != "test")
{
    setup();
    calculatePriority();
}

function setup() {
    source();
    _build();
    test();
}

function rebuild() {
    _build();
    test();
}

function source() {
    let gh_user = process.env.GH_USER;
    let gh_pass = process.env.GH_PASS.replace("@", "%40");  // My password happens to have a @ !!! - zli58
    let getSourceCodeCommands = [
        `cd ${process.env.HOME}`,
        'rm -rf iTrust2-v6',
        `git clone https://${gh_user}:${gh_pass}@github.ncsu.edu/engr-csc326-staff/iTrust2-v6.git`
    ];
    child.spawnSync(getSourceCodeCommands.join(" && "), {stdio: "inherit", shell: true});

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
    let buildCommands = [
        `cd ${projectFolder}`,
        "mvn clean process-test-classes -f pom-data.xml"
    ];
    child.spawnSync(buildCommands.join(" && "), {stdio: "inherit", shell: true});
}

function test() {
    let testCommands = [
        `cd ${projectFolder}`,
        "mvn clean test verify org.apache.maven.plugins:maven-checkstyle-plugin:3.1.0:checkstyle"
    ];
    child.spawnSync(testCommands.join(" && "), {stdio: "inherit", shell: true});
}

function readResults(result)
{
    var tests = [];
    for( var i = 0; i < result.testsuite['$'].tests; i++ )
    {
        var testcase = result.testsuite.testcase[i];
        
        tests.push({
        name:   testcase['$'].name, 
        time:   testcase['$'].time, 
        status: testcase.hasOwnProperty('failure') ? "failed": "passed"
        });
    }    
    return tests;
}

async function calculatePriority()
{
    // TODO
    var contents = fs.readFileSync(testReport)
    let xml2json = await Bluebird.fromCallback(cb => parser.parseString(contents, cb));
    var tests = readResults(xml2json);
    tests.forEach( e => console.log(e));

    return tests;
}

// module.exports.calculatePriority = calculatePriority;