# DevOps-1

## Commands
From project root directory, these commands can be executed:

-   npm install
    
    Install nodejs dependencies.

-   npm link
    
    Link the `pipeline` command.
  
-   pipeline setup
    
    Setup jenkins and build environment for checkbox.io.
  
-   pipeline build checkbox.io
    
    Update the pipeline code and trigger a build.

## Experience
### Jenkins (Andrew Miller)

### Build environment (Zhuowei Li)
- I learned what dependencies need to be installed. Some of them I know directly from documents, while some I figure out by communicating with teammates and trying in practice. 

- I learned the basic user and database management of mongodb to figure out what need to be setup for it to work. At first I had misunderstanding about how mongodb authentication and permissions work and had a hard time to make it work. The incorrect setup of mongodb caused tests of the app to fails, which gave me hint that the connection string the app uses does not work and my understanding is wrong. Finally by reading document carefully I figured out that the user permission stuff should be set under `admin` database and therefore resolve the problem.

- I learned how to handle secrets correctly in the project context. At first I misunderstand what is said in the project specification and wrongly committed the vault password. With the help of Andrew, TA and  Professor finally I realized the correct way and was able to make the changes.

- I learned and gained experience on how to manage the project using Github Project facilities. 

- I learned how to communicate effectively with other teammates using Mattermost and Zoom.

### Pipeline (Qingyan Wang)
