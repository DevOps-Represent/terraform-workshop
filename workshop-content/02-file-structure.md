# File Structure
In this section we're going to talk about how your Terraform directory is set up. It's best to now open the repo you cloned in your text editor now.

Let's take a look a the files that make up the repo:
![file-structure-visual-guide](../images/file-structure.png)

## Your Workspace
`workspace` - This is your working directory and where Terraform checks to detect anything to deploy, update or delete. 
This is also called the `Root Module`

`/config` - Files contained within `config` allow you to deploy different values based on environment. E.g. deploying to dev and prod with different bucket names or EC2 instance sizes. 

`dev.tfvars` - This file is an example of a file that contains the value of variables specific to `dev`

`.gitignore` - This file prevents files from being added to your GitHub commit. We're going to use this to ensure we don't commit terraform state files. 

`s3_bucket.tf` - This file is an example of a file that terraform will look at to deploy, update or delete a resource.

`variables.tf` - This file can be used to set variables that can be extracted from the `.tfvars` fules within the config folder. 


## [NEXT SECTION  - Remote State Set Up 👉🏽](03-remote-state-set-up.md)
