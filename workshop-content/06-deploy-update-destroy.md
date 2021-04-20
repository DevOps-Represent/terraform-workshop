# Terraform Deployments
In this section, we are now going to look at the following Terraform commands:
* Validating
* Plan
* Apply
* Destroy


## Validating your Terraform
Great job! You've added all the pieces of the puzzle! Let's see if our terraform is valid!

Run the following command to fix any formatting issues with your Terraform:

`terraform fmt -diff`

Run the following command to confirm your config is valid:

`terraform validate`

Running the command above may return an error for you to fix. Here's tips for debugging:
* Read the error message carefully, it will usually tell you exactly where there's an error
* Check the consistency on naming your variables, for example using `bucket_name` and then `bucketname` will cause issues
* Doing an internet search of the error you're getting

## Terraform Plan
'Plan' is the way Terraform tells you what it is planning to deploy. This helps make your deployments safer as you can validate the changes you are expecting to see - as opposed to unexpectated changes that could lead to a potential incident.

Run the following command:

`terraform plan -var-file="config/dev.tfvars"`

By adding the `-var-file` input you can specify which variable values you would like to apply to your stack - in our case our bucket name is different for dev and prod.

## Terraform Apply
Once you're happy with 'the plan', you can now deploy your changes! This is the command we will be running:

`terraform apply -var-file="config/dev.tfvars"`

**NOTE: If you have made changes since last running `terraform plan`, you will need to run this again before running `terraform apply`**

Hopefully your stack deploys without any issues and your s3 bucket is now deployed.

There's a few ways you can check the success:
* Run `aws s3 ls` in the command line and find your bucket
* Log into the AWS console in the browser and find your bucket
* Hit your s3 bucket website from a brower: http://[bucket_name].s3.amazonaws.com/

*If you want to deploy your prod stack just update the name of the tfvars file from `config/dev.tfvars` to `config/prod.tfvars`*

## Terraform Destroy
Now that it's time to clean up our work, let's destroy our stack! If you ever want to get your stack back, that is the beauty of infrastructure as code - you can easily re-deploy it exactly as it was before.

To clean up your account, run the following command:

`terraform plan -destroy -var-file="config/dev.tfvars"`

and if you are happy with the 'destroy plan', then run:

`terraform destroy -var-file="config/dev.tfvars"`

Great work! Now you can use the suggestions above to also confirm your s3 bucket has in fact been deleted.

*If you want to destroy your prod stack just update the name of the tfvars file from `config/dev.tfvars` to `config/prod.tfvars`*


## [NEXT SECTION  - Summary 👉🏽](07-summary.md)