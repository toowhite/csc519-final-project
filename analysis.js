const esprima = require("esprima");
const options = {tokens: true, tolerant: true, loc: true, range: true};
const fs = require("fs");
const path = require("path")

function main() {
    const args = process.argv.slice(2);

    let files = getAllFiles(args[0])

    for (let i in files) {
        complexity(files[i])
    }

    for (let node in fileBuilders) {
        let builder = fileBuilders[node];
        builder.report();
    }

    for (let node in fileBuilders) {
        let builder = fileBuilders[node]
        if (builder.MaxCallChains > 10 || builder.MaxNestedIfDepth > 5 || builder.Lines > 100) {
            console.log(`\n**** Code smell detected! Failing build...\n`)
            process.exit(1)
        }
    }
}

function getAllFiles(parentDirectory) {
    let files = []
    const hmm = function (currentDirectory) {
        let currentFiles = fs.readdirSync(currentDirectory)
        currentFiles.forEach(function (file) {
            if (fs.statSync(currentDirectory + "/" + file).isDirectory()) {
                if (file !== 'node_modules') {
                    files.concat(hmm(currentDirectory + "/" + file))
                }
            } else {
                if (file.endsWith('.js') && file !== 'index.js') {
                    files.push(path.join(currentDirectory, "/", file))
                }
            }
        })
    }
    hmm(parentDirectory)
    return files;
}

const fileBuilders = {};

// Represent a reusable "class" following the Builder pattern.
function FunctionBuilder() {
    this.StartLine = 0;
    this.FunctionName = "";
    // The number of parameters for functions
    this.ParameterCount = 0,
        // Number of if statements/loops + 1
        this.SimpleCyclomaticComplexity = 0;
    // The max depth of scopes (nested ifs, loops, etc)
    this.MaxNestingDepth = 0;
    // The max number of conditions if one decision statement.
    this.MaxConditions = 0;
    this.Lines = 0;

    this.report = function () {
        console.log(
            (
                "\t{0}(): {1}\n" +
                "\t============\n" +
                "\tlines: {2}\n"
            )
                .format(this.FunctionName, this.StartLine, this.Lines)
        );
    }
}

// A builder for storing file level information.
function FileBuilder() {
    this.FileName = "";
    // Number of strings in a file.
    this.Strings = 0;
    // Number of imports in a file.
    this.ImportCount = 0;
    //if statements
    this.IfStatements = 0;
    this.MaxCallChains = 0;
    this.MaxNestedIfDepth = 0;
    this.Functions = {};

    this.report = function () {
        console.log(
            ("{0}\n" +
                "~~~~~~~~~~~~\n" +
                "max chains: {1},\t" +
                "max nested if: {2}\n"
            ).format(this.FileName, this.MaxCallChains, this.MaxNestedIfDepth));
        for (let functionBuilder in this.Functions) {
            this.Functions[functionBuilder].report()
        }
        console.log(`---\n`)
    }
}

// A function following the Visitor pattern.
// Annotates nodes with parent objects.
function traverseWithParents(object, visitor) {
    let key, child;

    visitor.call(null, object);

    for (key in object) {
        if (object.hasOwnProperty(key)) {
            child = object[key];
            if (typeof child === 'object' && child !== null && key !== 'parent') {
                child.parent = object;
                traverseWithParents(child, visitor);
            }
        }
    }
}

function complexity(filePath) {
    const buf = fs.readFileSync(filePath, "utf8");
    const ast = esprima.parse(buf, options);

    const i = 0;

    // A file level-builder:
    const fileBuilder = new FileBuilder();
    fileBuilder.FileName = filePath;
    fileBuilder.ImportCount = 0;
    fileBuilders[filePath] = fileBuilder;

    // Tranverse program with a function visitor.
    traverseWithParents(ast, function (node) {
        if (node.type === 'FunctionDeclaration') {
            const builder = new FunctionBuilder();

            builder.FunctionName = functionName(node);
            builder.StartLine = node.loc.start.line;
            builder.ParameterCount = node.params.length
            builder.Lines = node.loc.end.line - node.loc.start.line + 1

            fileBuilder.Functions[builder.FunctionName] = builder;
        } else if (node.type === 'Literal') {
            fileBuilder.Strings += 1;
        } else if (node.type === 'IfStatement') {
            let ifCount = 0;
            while (Array.isArray(node) || node.type === 'IfStatement' || node.type === 'BlockStatement') {
                if (node.type === 'IfStatement') {
                    ifCount++;
                }
                node = node.parent
            }
            if (ifCount > fileBuilder.MaxNestedIfDepth) {
                fileBuilder.MaxNestedIfDepth = ifCount;
            }
        } else if ((node.type === 'CallExpression' && node.callee.type === 'Identifier') ||
            (node.type === 'MemberExpression' && node.object.type === 'Identifier')) {
            let chains = countChains(node)
            if (chains > fileBuilder.MaxCallChains) {
                fileBuilder.MaxCallChains = chains;
            }
        }
    });
}

function countChains(node) {
    let chains = 0;
    while (node.type !== 'ExpressionStatement' &&
    node.type !== 'ReturnStatement' &&
    node.type !== 'VariableDeclarator' &&
    node.type !== 'BinaryExpression' &&
    node.type !== 'IfStatement') {
        if (node.type === 'MemberExpression') {
            chains++;
        }
        node = node.parent
    }
    return chains;
}

// Helper function for printing out function name.
function functionName(node) {
    if (node.id) {
        return node.id.name;
    }
    return "anon function @" + node.loc.start.line;
}

// Helper function for allowing parameterized formatting of strings.
if (!String.prototype.format) {
    String.prototype.format = function () {
        var args = arguments;
        return this.replace(/{(\d+)}/g, function (match, number) {
            return typeof args[number] != 'undefined'
                ? args[number]
                : match
                ;
        });
    };
}

main();

exports.main = main;