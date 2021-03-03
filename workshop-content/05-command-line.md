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
Now we're going to run the `terraform init` command to config the back by mapping to the resources we've created in our [remote-state-set-up](04-remote-state-set-up.md) steps

```
  terraform init \
    -backend-config=region=$global_region \
    -backend-config=bucket=devops-girls-terraform-$account_id \
    -backend-config=key=terraform.tfstate \
    -backend-config=dynamodb_table=devops-girls-terraform
```

### Define workspace

```
  export workspace=devops-girls-terraform-workshop

  terraform workspace new $workspace 2> /dev/null || true
  terraform workspace select $workspace
```
*This is just some bash magic that basically checks whether the workspace already exists and if it doesn't to create a workspace.*

## Instructions for Windows