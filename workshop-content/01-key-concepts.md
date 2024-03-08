# Key Concepts
This section will cover the key concepts we're going to be referencing throughout the workshop.

## What is Terraform?
Terraform is an open-source tool for building infrastructure/service as code. It was created by Hashicorp and is maintained and updated by a very active open-source community.

Terraform is made up of its own command line tool, syntax and file/directory structure.

Terraform is cloud agnostic. This means, you can deploy your infrastructure across multiple cloud providers using the same method. This is unlike Cloudformation which is only used for AWS and Azure's Resource Manager templates for deploying to Azure only. 

Here's the [Full List of Providers](https://registry.terraform.io/search/providers?namespace=hashicorp)

## Why should I be learning Terraform?
Terraform makes infrastructure as code easy and is a really important tool if you want your tech stacks to be easily deployable, version controlled and replicable. 

When new services are introduced to cloud provides such as AWS, you're more likely to be able to deploy it using Terraform before Cloudformation - this is thanks to the highly active open-source community.

Terraform enables you to preview what your changes will do before you deploy. This can be helpful for key infra where you require a high confidence in your changes being deployed.

The documentation is excellent. This means using Terraform can be easier to learn that other methods for infra as code.

## How does Terraform work?

### API Driven
Terraform works using API calls to the provider to create, manage and modify resources. 
For example setting up an S3 resource in Terraform, will make an api call to the aws cli to create a S3 bucket in an authorized account. 

### Manages State of Resources
Terraform has local or remote state to keep track of infrastructure. 
This is how Terraform knows the current state of your technology stack vs the changes you want to apply. 

For multiple people to work on the same terraform infra, you would use the remote state. 

### Logically seperate out config and standardize infrastructure
Terraform reads all the configuration and resource files in the repo at the time it creates the plan. This makes it easy to logically set up your seperate files to make it easy to update, without writing extra code. 

E.g. creating a file for each service you are using such as `s3_bucket.tf`, `EC2.tf` etc that contain all the required Terraform resources to deploy such as policys, tags or additional roles. 

You can also use premade, or organisationally made Terraform Modules to further share and standardize the way you deploy resources, without affecting the end result of your resources in your Cloud provider. 

### Preview and deploy changes
Terraform once it has been initalized, allows you to make a plan of the changes based on the config files in your project folder. 
The Terraform cli lets you preview these changes with an execution plan. 

Once a plan has successfully been created and you are happy with the changes, you can deploy the plan to create or modify the infrastructure. 

## [NEXT SECTION  - File Structure 👉🏽](02-file-structure.md)