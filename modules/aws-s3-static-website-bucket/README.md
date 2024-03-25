# aws_s3_static_website_bucket

Module is used to provision `aws_s3_static_website_bucket` resource.

## Usage example

```
module "aws-s3-static-website-bucket" {
    source = "modules/aws-s3-static-website-bucket"
    bucket_name = var.bucket_name
    account_id = data.aws_caller_identity.current.account_id
}
```
