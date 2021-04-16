# Terraform Files
In this section we're going to prepare our infrastructure using terraform files!

Here's the files we can now create at the root-level in our repo:

#### `terraform.tf`
In this file, we're going to configure:
* the version/provider of Terraform we're working with
* our s3 state back end
* AWS as a provider

#### `variables.tf`
In this file, we're going to configure any variables we would like to use in our infrastructure as code

### config/dev.tfvars and prod.tfvars
In this file, we're going to provide different variable values based on whether its considered `dev` or `prod`

#### `s3_bucket.tf`
In this file, we're going to configure an s3 bucket that is enabled for basic website hosting

#### `policy.json`
In this file, we're going to provide a bucket policy that enables public-read access so people can view your website

## terraform.tf
Now that we have created this file in the root-level of our repo, let's start filling in the required information:

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

## variables.tf
This is file used to declare what variables we will have to work with.

Let's declare `bucket_name` as a variable:
```
variable "bucket_name" {
  type        = string
  description = "The name of the bucket - this must be unique"
}
```

## config/dev.tfvars and prod.tfvars
Let's now give our `bucket_name` variable a value!

```
# NOTE: bucket names are GLOBAL, this means they have to be unique
bucket_name = "devopsgirls-terraform-[XXXX]-[dev/prod]"
```
Where `XXXX` appears, we need to fill in with some information

As bucket names must be unique, replace `XXXX` with a unique value like your name!

## s3_bucket.tf
Here's where we configure an s3 bucket for website hosting. Let's try and avoid a simple copy paste and take a look at the official documentation to fill in the required information!

```
# S3 bucket for web hosting
resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket = "XXXX"
  acl    = "XXXX"
  policy = templatefile("policy.json")

  website {
    index_document = "XXXX"
    error_document = "XXXX"
  }
}

```
Where `XXXX` appears, we need to fill in with some information:

* `bucket` - we will be using our `bucket_name` variable here - here's the docs on [How To Use Variables](https://www.terraform.io/docs/language/values/variables.html#using-input-variable-values)
* `acl` - let's take a look at the docs, which value do you think is best for web hosting? [Terraform AWS Docs ACL](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#acl)
* `index_document` - we've provided you with some basic website files in the folder [website_files](/website_files)
* `error_document` - we've provided you with some basic website files in the folder [website_files](/website_files)

## policy.json
AWS documentation provides us with the bucket policy required for web hosting, so let's copy and paste that into our file - [s3 bucket policy for web hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html) - find "Granting read-only permission to an anonymous user"

**NOTE: you'll need to use your `bucket_name` variable in your policy**

## Validating your Terraform
Great job! You've added all the pieces of the puzzle! Let's see if our terraform is valid!

Run the following command to fix any formatting issues with your Terraform:

`terraform fmt -diff`

Run the following command to vaidate your config if valid:

`terraform validate`
