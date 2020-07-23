# DevOps-1
## Screencast and results
### Milestone 3
// TODO

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
    
    //TODO

-   **pipeline canary master broken**

    This command triggers canary analysis on *broken* service against *master* service. A report indicated metric classfications and canary score will be output, after roughly 2 minuites. **Before running the command, remember to switch to the *canary* branch of *Monitoring_for_M3* repo.**

## Experience (Milestone 3)

### Andrew Miller

// TODO

### Zhuowei Li

// TODO

### Qingyan Wang

// TODO

## Old experiences can be find in [Experience Archive](ExperienceArchive.md)