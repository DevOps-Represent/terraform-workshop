# Terraform Files

In this section we are going to prepare our infrastructure using terraform files!

Here's the files we can now edit in our repo:

**`variables.tf`**

In this file, we are going to configure any variables we would like to use in our infrastructure as code

**`config/dev.tfvars and prod.tfvars`**

In this file, we are going to provide different variable values based on whether its considered `dev` or `prod`

**`s3_bucket.tf`**

In this file, we are going to configure an s3 bucket and bucket policy that is enabled for basic website hosting

Here's what we're creating:

![s3 bucket for web hosting](../images/s3-web-hosting.png)

---

## `variables.tf`

This is file used to declare what variables we will have to work with.

Let's declare `bucket_name` as a variable:

```
variable "bucket_name" {
  type        = string
  description = "The name of the bucket - this must be unique"
}
```

---

## `config/dev.tfvars and prod.tfvars`

Let's now give our `bucket_name` variable a value!

```
bucket_name = "devops-represent-terraform-[XXXX]-[dev/prod]"
```

Where `XXXX` appears, we need to fill in with some information

As bucket names must be unique, replace `XXXX` with a unique value like your name!

---

## `s3_bucket.tf`

Here's where we create and configure an s3 bucket and policy for website hosting. You'll see we're using [Terraform 'resource'](https://www.terraform.io/docs/language/resources/syntax.html) for this.

Let's try and avoid a simple copy paste and take a look at the official documentation to fill in the required information!

```
# S3 bucket for web hosting
resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket = "${XXXX}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Public = "Testing bucket as part of workshop content"
  }
}

resource "aws_s3_bucket_ownership_controls" "web_hosting_ownership" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  rule {
    object_ownership = "XXXX"
  }
}

resource "aws_s3_bucket_public_access_block" "web_hosting_public_access_block" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "web_hosting_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.web_hosting_ownership,
    aws_s3_bucket_public_access_block.web_hosting_public_access_block]

  bucket = aws_s3_bucket.web_hosting_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "web_hosting_website" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  index_document {
    suffix = "XXXX"
  }

  error_document {
    key = "XXXX"
  }
}

# Bucket Policy
resource "aws_s3_bucket_policy" "web_hosting_policy" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  policy = data.aws_iam_policy_document.web_hosting_policy.json
}

data "aws_iam_policy_document" "web_hosting_policy" {
  statement {
    principals {
      type        = "XXXX"
      identifiers = ["*"]
    }

    actions = ["XXXX"]

    resources = [
      XXXX,
      "XXXX/*"
      ]
  }
}

```

Where `XXXX` appears, we need to fill in some information:

### s3 Bucket

- `bucket` - we will be using our `bucket_name` variable here - here is the documentation on [How To Use Variables](https://www.terraform.io/docs/language/values/variables.html#using-input-variable-values)
- `object_ownership` - how should ownership of objects that are uploaded to the bucket be assigned? Which value should be used in our case? [Terraform AWS Docs Ownership Controls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls)
- `acl` - let's take a look at the docs, which value do you think is best for web hosting? [Terraform AWS Docs ACL](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl)
- `index_document` - we've provided you with some basic website files in the folder [website_files](/website_files)
- `error_document` - we've provided you with some basic website files in the folder [website_files](/website_files)

---

### Bucket Policy

AWS documentation provides us with the bucket policy required for web hosting, so let's use this to fill in the fields with `XXXX`

- `Type, Action`: [s3 bucket policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy)
- `Resource` - you'll need the s3 bucket ARN, which can be done with Terraform - [use this example to work out how to add your ARN](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy#basic-usage)

## [NEXT SECTION - Terraform Commands 👉🏽](06-deploy-update-destroy.md)
