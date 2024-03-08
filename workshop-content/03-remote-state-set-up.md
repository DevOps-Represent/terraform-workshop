# Remote State - s3 and DynamoDB
In this section we're going to go through the steps of setting up your remote state resources.

There's [more than one way to set up your remote state](https://www.terraform.io/docs/language/settings/backends/index.html), the way we're doing it today is using AWS resources, here's the [official Terraform documentation](https://www.terraform.io/docs/language/settings/backends/s3.html) on this.

We're going to deploy these resources using Cloudformation in ap-southeast-2 Sydney **(Make sure you're in the right region!)**

The Cloudformation template we're using can be found [HERE](../remote-state/stack.yaml).

This [template](../remote-state/stack.yaml) provisions a CloudFormation stack in ap-southeast-2 that contains a S3 bucket named devops-represent-terraform-XXXXX where XXXXX is the ID of the AWS account, as well as a DynamoDB lock table.

To deploy this stack we can log into the AWS Console and follow these steps:

1. Navigate to Cloudformation
2. Create Stack (With new resources)
3. Select `Template is ready`
4. Select `Upload a template file`
5. Click `Choose file`
6. Select your locally saved file `/remote-state/stack.yaml`
7. Click `Next`
8. Give your stack a name `devops-represent-terraform-workshop`
9. Check your parameters (LockTableName = terraform, StateBucketNamePrefix=devops-represent-terraform)
10. Click `Next`
11. Click `Next`
12. Click `Create Stack`

Great job! You've deployed an s3 Bucket and DynamoDB Table

## How does this work though?

![remote-state](../images/s3-remote-state.png)

`S3 bucket` - Stores the state of your Terraform stack

`DynamoDB Table` - Used for State Locking and Consistentcy Checking. It does this by storing bucket and key variables in a table. 

### What is State Locking and why does it matter?
State locking prevents two or more people making concurrent changes to a stack. This is important when multiple people are working with Terraform to create infrastructure.

For instance if

* Person A modfies an S3 bucket with terraform. 
* Meanwhile Person B modifies the same S3 bucket in their terraform at the same time. 

If there is no state locking, then its easy for there to be changes that Terraform is not aware of when it applies the plan. Causing the one or both of the terraform applies to fail. 

A State lock prevents this by only allowing one user at a time to modify, create or delete a resource. Other users trying to modify the resource at the same time get a message to tell them this resource is locked.

Once Person A has finished their apply, the resource is unlocked and Person B can see the updated changes in their Terraform to the resource before they apply their changes.  

## [NEXT SECTION  - Command Line 👉🏽](04-command-line.md)

