# DevOps-1
## Screencast and results
### Milestone 3
- Screencast: https://youtu.be/s8HzEcTs4hM

  checkbox.io deployment failed when recording the screencast, therefore we have a separated recording for it.
  
- checkbox.io cloud deployment screencast: https://drive.google.com/file/d/1Qurxt5fHTbw4axHGLDPzaeTsldr4O93H/view?usp=sharing

### Milestone 2
- Results after running `pipeline useful-tests -c 100`: https://github.ncsu.edu/cscdevops-summer2020/DevOps-1/blob/master/result.txt
- Screencast: https://drive.google.com/file/d/1VVX2LR9Z-BAz675WG-IhIQdwCDN4cwki/view?usp=sharing

### Milestone 1
- Screencast: https://drive.google.com/file/d/1hi6hP5PlqW6-jEDKOyBDMjSNYoPcPMuY/view?usp=sharing


## Commands
From project root directory, these commands can be executed:

-   **pipeline setup --gh-user \<username\> --gh-pass \<password\>**
    
    Setup jenkins and build environment. `gh-user` and `gh-pass` are your NCSU Unity ID and password, respectively.
  
-   **pipeline build \<jobName\> -u \<admin\> -p \<admin\>**
    
    Update the pipeline code and trigger a build. Supported jobs are `checkbox.io` and `iTrust`.

-   **pipeline prod up**

    Setup prod environment on DigitalOcean. Environment variables **NCSU_DOTOKEN** and **NCSU_SSH_KEY** should be set. Refer to below pages for instructions.
    
    - NCSU_DOTOKEN: https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/
    - NCSU_SSH_KEY: https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/to-account/ 
      
      Here we should set the **fingerprint** of the ssh key, which can be gotten from DO UI.
      ![fingerprint](https://www.digitalocean.com/docs/images/droplets/ssh-account-key-added.cbbbb0fcd36f8e967ec4c998f1b1ffbe72b7c24a41a0ea43a9d3839979d9e77c.png)
    
    The command generates an ansible **inventory.ini** file under cm/ folder.

-   **pipeline monitor-setup -i \<inventoryFile\>**

    The command sets up monitoring tools on prod environment. We extended the code used in [Monitoring](https://github.com/CSC-DevOps/Monitoring) workshop and developed the necessary monitoring tools. The git repo is https://github.ncsu.edu/zli58/Monitoring_for_M3.git. Use the **master** branch.

    Checkout the code into *Monitoring* folder under *DevOps-1* folder. Alternatively, you can checkout it elsewhere and [make a Junction](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink).

-   **pipeline deploy**
    
    **pipeline build iTrust -u <admin> -p <admin>**
    Creates a deployable war file for the iTrust2 application.
  
    **pipeline deploy iTrust -i inventory.ini**
    Configures the host server for iTrust2 specified in inventory.ini and deploys iTrust2 to this server.
    
    **pipeline deploy checkbox.io -i inventory.ini**
    Configures the host server for checkbox.io specified in inventory.ini and deploys checkbox.io to this server.

-   **pipeline canary master broken**

    This command triggers canary analysis on *broken* service against *master* service. A report indicated metric classfications and canary score will be output, after roughly 2 minuites. **Before running the command, remember to switch to the *canary* branch of *Monitoring_for_M3* repo.**

## Experience (Milestone 3)

### Andrew Miller

- reverse proxy concepts, and how to automate the configuration of nginx for a node.js app.
- configuring a jenkins pipeline to package a war file based on the success of previous pipeline steps.
- automation of application deployment with forever and git hooks.
- automation of the deployment of a java application with tomcat.
- automation of dumping and importing a mysql database from one server to another.

### Zhuowei Li

- Overall I think this workshop is quite challenging, but also I learned a lot.
- I learned how to organize large numbers of anisble and bash scripts in a logical way. 
- I learned how to write more robust Nodejs scripts, like modularization, error handling, etc.
- I learned to use branch to organize different features of a repository.
- For the canary analysis task, I learned how to use Mann-Whitney U test in the context of determining whether the metrics of 2 servers are significantly different.

### Qingyan Wang

- Tomcat configuration and deployment with war file using ansible-playbook. Users difference between root and vagrant need to be cared.
- Capital letters iTrust needs to be taken care in js commandline, sh file and playbooks.
- The mm_rsa and id_rsa files for local and Digital Ocean authentication is created in setup pipeline. But DO will need DOTOKEN and SSH_KEY for access DO API. These are set as environmental variales.
- From local deployment to DO deployment, some configurations change because user and environment changed.
- If ansible is suffering a long time on gathering facts, add a gather_timeout parameter to 30 secs in ansible.cfg.

## Old experiences can be find in [Experience Archive](ExperienceArchive.md)
