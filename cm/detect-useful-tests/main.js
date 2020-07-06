const fs = require('fs');
const xml2js = require('xml2js');
const child = require('child_process');
const parser = new xml2js.Parser();
const Bluebird = require('bluebird');
const Random = require('random-js');
const path = require("path");
const FileHound = require('filehound');

async function mutate() {
    let files = getAllFiles(projectFolder);
    let mutationPromises = [];
    for (let i in files) {
        if (files.hasOwnProperty(i) && new Random.Random().bool(0.1)) {
            console.log(`mutating file: ${files[i]}`);
            mutationPromises.push(mutateFile(files[i]));
        }
    }
    return Promise.all(mutationPromises);
}

async function mutateFile(filePath) {
    let lineReader = require('readline').createInterface({
        input: require('fs').createReadStream(filePath)
    });

    let buf = "";

    lineReader.on('line', function (line) {
        if (!line.startsWith("import") &&
            !line.includes("@JoinColumn") &&
            !line.includes("@Table") &&
            !line.includes("@GeneratedValue") &&
            !line.includes("@JoinColumn") &&
            !line.includes("@Convert") &&
            !line.includes("@JsonAdapter") &&
            !line.includes("@Enumerated") &&
            !line.includes("@Transactional") &&
            !line.includes("@Inheritance") &&
            !line.includes("@Fetch") &&
            !line.includes("@Min") &&
            !line.includes("@Max") &&
            !line.includes("@Pattern") &&
            !line.includes("@Length") &&
            !line.includes("@Entity") &&
            !line.includes("@ElementCollection") &&
            !line.includes("@ManyToOne") &&
            !line.includes("@OneToMany") &&
            !line.includes("@ComponentScan") &&
            !line.includes("@SuppressWarnings") &&
            new Random.Random().bool(0.1)
        ) {
            line = line.replace(/"\S+"/g, "\"cool\"");
            if (/if\s*\(/.test(line)) {
                if (line.includes(">")) {
                    line = line.replace(/>/g, "<");
                } else line = line.replace(/</g, ">");
            }
            if (line.includes("=="))
                line = line.replace(/==/g, "!=");
            else line = line.replace(/!=/g, "==");
            line = line.replace(/0/, "1");
            if (/return\s+true;/.test(line))
                line = line.replace(/return\s+true;/, "return false;");
            else line = line.replace(/return\s+false;/, "return true;");
        }
        buf += `${line}\n`;
    });

    return new Promise((resolve) => {
        lineReader.on('close', function (line) {
            fs.writeFileSync(filePath, buf);
            resolve(filePath);
        });
    });
}

function getAllFiles(parentDirectory) {
    let files = []
    const hmm = function (currentDirectory) {
        let currentFiles = fs.readdirSync(currentDirectory)
        currentFiles.forEach(function (file) {
            if (fs.statSync(currentDirectory + "/" + file).isDirectory()) {
                if (!currentDirectory.includes("/src/test/"))
                    files.concat(hmm(currentDirectory + "/" + file));
            } else {
                if (file.endsWith('.java')) {
                    files.push(path.join(currentDirectory, "/", file));
                }
            }
        })
    }
    hmm(parentDirectory);
    return files;
}

function source() {
    let gh_user = encodeURIComponent(process.env.GH_USER);
    let gh_pass = encodeURIComponent(process.env.GH_PASS);
    let getSourceCodeCommands = [
        `cd ${process.env.HOME}`,
        'rm -rf iTrust2-v6',
        `git clone https://${gh_user}:${gh_pass}@github.ncsu.edu/engr-csc326-staff/iTrust2-v6.git`,
        `cd ${projectFolder}`,
        `mvn dependency:resolve`
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

async function compile() {
    console.debug("Start compiling...");
    let commands = [
        `cd ${projectFolder}`,
        "mvn clean process-test-classes -f pom-data.xml",
    ];

    let process = child.spawn(commands.join(" && "), {stdio: "inherit", shell: true});

    return new Promise((resolve) => {
        process.on('exit', (code) => {
            resolve(code == 0);
        });
        setTimeout(() => {
            child.spawnSync(`pkill -P ${process.pid}`, {stdio: "inherit", shell: true});
            process.kill();   
            resolve(false);
        }, 60 * 1000);
    });
}

function test() {
    console.debug("Start testing...");
    let testCommands = [
        `cd ${projectFolder}`,
        "mvn clean test verify org.apache.maven.plugins:maven-checkstyle-plugin:3.1.0:checkstyle"
    ];
    let result = child.spawnSync(testCommands.join(" && "), {stdio: "pipe", shell: true});
    // fs.writeFileSync("test_stdout.log", result.stdout, {flag: "w"});
    // fs.writeFileSync("test_stderr.log", result.stderr, {flag: "w"});
    console.log("Tests complete.");
}

function readResults(result) {
    let tests = [];
    for (let i = 0; i < result.testsuite['$'].tests; i++) {
        let testcase = result.testsuite.testcase[i];

        let key = (testcase['$'].classname).concat(testcase['$'].name);
		if (!testMap.has(key)) {
			testMap.set(key, 0);
		}
		let testStatus = testcase.hasOwnProperty('failure') ? "failed": "passed"
		if (testStatus == "failed") {
			testMap.set(key, testMap.get(key) + 1);
		}
    }
    return tests;
}

async function calculatePriority(testReport) {
    let contents = fs.readFileSync(testReport)
    let xml2json = await Bluebird.fromCallback(cb => parser.parseString(contents, cb));
    let tests = await readResults(xml2json);

    return tests;
}

function reset() {
    // console.log(`rm ${__dirname}/*.log`);
    let commands = [
        `cd ${projectFolder}/..`,
        "git reset --hard",
        // 'pkill -f "mvn clean"',
        // 'mysql --user="root" --password="$mysql_root_password" --database="iTrust2" --execute="DROP DATABASE iTrust2;"',
        // " "
    ];

    child.spawnSync(commands.join(" ; "), {stdio: "inherit", shell: true});
}

async function gatherResults() {
	console.log("Gathering results...")
    let testFolder = projectFolder + "/target/surefire-reports";
	await FileHound.create().paths(testFolder).ext('xml').find().then(async files => { await files.forEach(file => calculatePriority(file)) });
}

const projectFolder = `${process.env.HOME}/iTrust2-v6/iTrust2`;
if (process.argv.length < 3) {
    throw new Error("Insufficient arguments");
}
const noOfMutations = process.argv[2];

// Saving results
let testMap = new Map();

(async () => {
    source();
    let i = 0;
    while (i < noOfMutations) {
        console.log(`Starting the ${i+1}th mutation...\n`)
        reset();
        config();
        await mutate();

        let result = await compile();
        console.log(`Compiling: ${result ? "successfully" : "failed"}`)
        if (!result) {
            continue;
        }

        test();
        await gatherResults();
        i += 1;
        console.log("------------------------------------------------\n\n");
    }

    // TODO: more readable code
    testMap[Symbol.iterator] = function* () {
		yield* [...this.entries()].sort((a, b) => b[1] - a[1]);
	}

	for (let [key, value] of testMap) {
		console.log(value + '/' + noOfMutations + " " + key);
	}
})();