# Terraform in the Command Line
In this section we're going to start running some commands to get our workspace set up and ready to deploy some cloud resources - exciting!

Open up your command line tool.

## Instructions for Mac

### Terraform initialization
Through a combination of AWS magic and some set variables, we're going to initialize our Terraform and set our remote state at the same time - nice!

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