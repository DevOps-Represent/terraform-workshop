# Terraform in the Command Line

In this section we're going to start running some commands to get our workspace set up and ready to deploy some cloud resources - exciting!

Open up your command line tool.

## Instructions for Mac

### Terraform initialization

Through a combination of AWS magic and some set variables, we're going to initialize our Terraform and set our remote state at the same time - nice!

We're going to use the AWS CLI to get your AWS account ID to make your bucketname unique and set the region to Sydney.

```
export account_id=$(aws sts get-caller-identity --query Account --output text)
export global_region=ap-southeast-2
```

Now we're going to run the `terraform init` command to config the backend by mapping to the resources we've created in our [remote-state-set-up](04-remote-state-set-up.md) steps. Before we can do this, we need to update some of our Terraform files for this step to complete (more on this later!). For now, we're going to update the `terraform.tf` file to contain some valid values.

```
terraform {
  required_version = "XXXX"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "XXXX"
    }
  }

```

Where `XXXX` appears, we need to fill in with some information:

Run the following command to find out what version of Terraform you're working with:

`terraform -version`

To find out the LATEST version of AWS Terraform, you can visit this page: [AWS Latest Version](https://registry.terraform.io/providers/hashicorp/aws/latest)

---

Now that these values are filled in, run:

```
  terraform init \
    -backend-config=region=$global_region \
    -backend-config=bucket=devops-girls-terraform-$account_id \
    -backend-config=key=terraform.tfstate \
    -backend-config=dynamodb_table=terraform
```

### Define workspace

```
  export workspace=devops-girls-terraform-workshop

  terraform workspace new $workspace 2> /dev/null || true
  terraform workspace select $workspace
```

To check this has worked, you can run:

`terraform workspace list`

This should show your new workspace.

_This is just some bash that basically checks whether the workspace already exists and if it doesn't to create a workspace._

## [NEXT SECTION - Terraform Files 👉🏽](05-terraform-files.md)
