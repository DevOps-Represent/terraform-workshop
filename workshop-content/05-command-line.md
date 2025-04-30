# Terraform in the Command Line

In this section we're going to start running some commands to get our workspace set up and ready to deploy some cloud resources - exciting!

But first, we need confirm our provider details...

## `terraform.tf`

In this file, we are going to configure:

- the version/provider of Terraform we're working with
- our s3 state back end
- AWS as a provider

We need these values before we can initialise our Terraform.

Here's your `terraform.tf` file:

```terraform
terraform {
  required_version = "XXXX"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "XXXX"
    }
  }

  backend "s3" {
    workspace_key_prefix = "[YOUR-NAME]-terraform-workshop"
    region               = "ap-southeast-2"
    bucket               = "[YOUR-NAME]-terraform-workshop-state-bucket-[AWS-ACCOUNT-ID]"
    key                  = "terraform.tfstate"
    use_lockfile         = true
  }
}

```

Where `XXXX` appears, we need to fill in with some information:

Let's use the AWS CLI to get your AWS account ID to make your bucketname unique.

```bash
export account_id=$(aws sts get-caller-identity --query Account --output text)
```

Run the following command to find out what version of Terraform you're working with:

```
~ terraform version
```

Example output:

```
Terraform v1.11.4
on darwin_arm64
+ provider registry.terraform.io/hashicorp/aws v5.40.0
```

In this example, replace `XXXX` in `required_version` with `1.11.4` and in `version` with `5.40.0`

To find out the LATEST version of:

- Terraform, visit [Terraform Latest Version](https://developer.hashicorp.com/terraform/install)
- AWS Terraform, visit [AWS Latest Version](https://registry.terraform.io/providers/hashicorp/aws/latest)

---

### Terraform initialization

Through a combination of AWS magic and some set variables, we're going to initialize our Terraform and set our remote state at the same time - nice!

Open up your command line tool.

Now we're going to run the `terraform init` command to configure the backend by mapping to the resources we've created in our [remote-state-set-up](04-remote-state-set-up.md) steps.

```bash
terraform init
```

---

### Define workspace

Now we can create our workspace and give it a name:

```bash
export workspace=[YOUR-NAME]-terraform-workshop
terraform workspace new $workspace 2> /dev/null || true
terraform workspace select $workspace
```

To check this has worked, you can run:

```
terraform workspace list
```

This should show your new workspace. The `*` denotes which workspace you're using:

```
~ terraform workspace list
  default
* [YOUR-NAME]-terraform-workshop
```

---

<details><summary>Troubleshooting Tips</summary><p>

If you've had some issues already and the `terraform-init` command is telling you the bucket doesn't exist, try the following command to remove th state lock file:

```
rm -rf .terraform .terraform.lock.hcl
```

</p></details>

## [NEXT SECTION - Terraform Files 👉🏽](06-terraform-files.md)
