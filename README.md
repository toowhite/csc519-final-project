# DevOps-1
## Screencast and results
### Milestone 2
- Results after running `pipeline useful-tests -c 100`: https://github.ncsu.edu/cscdevops-summer2020/DevOps-1/blob/master/result.txt
- Screencast: TODO

### Milestone 1
- Screencast: https://drive.google.com/file/d/1hi6hP5PlqW6-jEDKOyBDMjSNYoPcPMuY/view?usp=sharing


## Commands
From project root directory, these commands can be executed:

-   **npm install**
    
    Install nodejs dependencies.

-   **npm link**
    
    Link the `pipeline` command.
  
-   **pipeline setup --gh-user \<username\> --gh-pass \<password\>**
    
    Setup jenkins and build environment for checkbox.io. `gh-user` and `gh-pass` are your NCSU Unity ID and password, respectively.
  
-   **pipeline build \<jobName\> -u \<admin\> -p \<admin\>**
    
    Update the pipeline code and trigger a build. Supported jobs are `checkbox.io` and `iTrust`.

-   **pipeline useful-tests -c 100**

    Initiate analysis of test suite for iTrust to run `-c` numbers of times.


## Experience (Milestone 2) 
### Andrew Miller

### Zhuowei Li

- I mainly worked on setting up the build environment of iTrust, fixing issues raised by TA in M1 feedback, and test analysis. Among the tasks above, I find the test analysis part is the hardest.
  
- In the test analysis task, it is very chanllenging to write robust code that can correctly do the operations, like compiling the code and reverting failed ones, or reseting the current status. When testing running 100 mutations, I even encountered memory leak issues that has to be handled. 
  
  To write robust code, one must have very good understading of the whole build process and relevant tools/languages. For example, we write the code mainly in Node.js, but in the code Maven and Bash are embedded extensively. If you are not familar with them, it becomes very painful to automize the build process, and will create very confusing outputs that take you a lot of time to understand.

- By the time of deadline, our code does work and demonstrates the core functionality, but honestly is not robust enough to handle all kinds of abnormality. It takes a lot time to develop the "testing framework" itself, and it is not an easy task. That further illustrates the usefulness of library like PIT; in industry, I will definitely try to reuse some open source like that rather than writing myself.

- To write good Node.js, one must understand its idiomatic "asynchronous pattern". For programmers accustomed to the synchronous way of coding, the "async/await" pairs and Promise pattern can easily create seemingly correct code, but actually do not do what you want. One should taking time to learn the basics before do the coding. 

- Bash weirdness is a real headache.

### Qingyan Wang
- The pipeline setup command arguments have the git authentication information, and it invokes a .sh file, in which curl command is used to create a Jenkins credential for GH authentication information. Using REST API to create/edit Jinkins's setting needs a CRUMB and a user API token, so to create the Jenkins credential, make sure CRUMB gotten from RESP API call is valid (403 error invalid CRUMB is always shown in different environment, it seems that the curl command syntax is fragile), then create user API token and credential information.

- The fuzz testing is a lot of work, so we distributed into 3 task: the work flow, code mutation, and suite test analysis. Basically, the work flow is: config environment, mutation, mvn clean test verify, suite test analysis, git reset --HEAD. The test export xml files which needs to be converted to json before read. 

- As a nodejs beginner, I met the asynchronous pattern when I was implementing the suite test analysis function. Need to spend time on the aync and await.

- Some tests in iTrust2 has a higher chance to pass after mutating. Fuzzing is a good and practical way of testing I would say.

## Experience (Milestone 1) 
### Jenkins (Andrew Miller)
- I learned how extraordinarily tricky it can be to automate the installation of a server like Jenkins on a remote server, which typically requires a manual setup process via a setup wizard. This required a great deal of templating and editing files on the remote server after creating an environment in which to install the Jenkins server. At this point, I have a deep admiration for Ansible, which made most of the heavy lifting chores a breeze. However, Ansible was particularly brilliant in neatly facilitating some of the more nuanced tasks, such as first searching for and then applying changes to a configuration file on the remote file system.

- I spent a great deal of time researching how to carry out the steps of the Jenkins setup wizard in an automated fashion. One of the greatest challenges was understanding how to set up the admin user for a particular username and password. Overall the automated setup of a Jenkins server was an epic learning experience, as it was essentially more of an open problem that required a great deal of research, experimentation and careful troubleshooting.

- I also learned how to remotely set up, trigger, and log the output of a Jenkins build. This was thankfully made simpler by the use of the Jenkins NPM plugin. However, we did have to overcome the challenge of waiting to print the log of the build until the build was actually in an executing state.

- I had an excellent experience collaborating with my teammates, and feel that we were able to work cohesively to complete the project.

### Build environment (Zhuowei Li)
- I learned what dependencies need to be installed. Some of them I know directly from documents, while some I figure out by communicating with teammates and trying in practice. 

- I learned the basic user and database management of mongodb to figure out what need to be setup. At first I had misunderstanding about how mongodb authentication and permissions work and create the user in a wrong database. The incorrect setup causes tests of the app to fails, which gave me hint that the db connection does not work and my understanding is wrong. Finally by reading document carefully I figured out that the user permission stuff should be set under `admin` database and therefore resolve the problem.

- I learned how to handle secrets correctly in the project context. At first I misunderstanded what is said in the project specification and wrongly committed the vault password. With the help of Andrew, TA and Professor I realized the correct way and was able to make the changes.

- I learned and gained experience on how to manage the project using Github Project issue board. 

- I learned how to communicate effectively with other teammates using Mattermost and Zoom.

### Pipeline (Qingyan Wang)

- I have learned the work idea of Jenkins authenticating configuration (DevOps-1/cm/roles/template/templates/jenkins_jobs.ini), the idea and purpose of Jenkins pipeline in groovy script. Some working attributes cannot be used by pipeline stype project for Jenkins, such as scm and builder, so we spent some time to figure out which attributes can work with pipeline.

- There are many Jenkins plugin that can be used to enhance the functionality of Jenkins to satisfy users' customization in developing environment. We have used workflow-aggregator, nodejs and git plugin in our project.

- It is better to setup the environment and install necessary packages before any Jenkins pipeline function. Because to install packages through pipeline, the user needs to be a sudoer to get permission of editing environment, otherwise the Jenkins will have "no tty present and no askpass program specified" error. Changing the sudoer files to get rid of the error is doable, but then Jenkins server can be modified by user without asking any permission, which means low security.

- I firstly used curl command to do the Jenkins build trigger. It needs to have a authentication token, a cromb, username and password to trigger the build to start, but then it comes out that this is done by sending http request, and http request cannot send back log file to console. In the late phase of this project, we switch to NPM Jenkins package, which can build job and get logstream using js code.

- I got good teamwork experience in this project.
