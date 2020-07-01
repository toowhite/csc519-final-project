var fs = require('fs'),
    xml2js = require('xml2js'),
    child  = require('child_process'); 
var parser = new xml2js.Parser();
var Bluebird = require('bluebird')

var projectFolder = "/var/lib/jenkins/workspace/iTrust/iTrust2";
var testFolder = projectFolder + "/target/surefire-reports";
var testReport =  testFolder + '/TEST-edu.ncsu.csc.itrust2.apitest.APIAppointmentRequestTest.xml';

if( process.env.NODE_ENV != "test")
{
    calculatePriority();
    // build();
}

function build() {
    // child.execSync(`cd ${projectFolder} && mvn clean process-test-classes -f pom-data.xml`);
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
    try{
        // child.execSync('cd simplecalc && mvn test');
    }catch(e){}
    var contents = fs.readFileSync(testReport)
    let xml2json = await Bluebird.fromCallback(cb => parser.parseString(contents, cb));
    var tests = readResults(xml2json);
    tests.forEach( e => console.log(e));

    return tests;
}

module.exports.calculatePriority = calculatePriority;