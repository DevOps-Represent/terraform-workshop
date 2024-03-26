module "aws-s3-static-website-bucket_1" {
    source = "modules/aws-s3-static-website-bucket"
    bucket_name = var.my_module_1["bucket_name"]
    account_id = data.aws_caller_identity.current.account_id
    tags = var.my_module_1["tags"]
}

module "aws-s3-static-website-bucket_2" {
    source = "modules/aws-s3-static-website-bucket"
    bucket_name = var.my_module_2["bucket_name"]
    account_id = data.aws_caller_identity.current.account_id
    tags = var.my_module_2["tags"]
}