# S3 bucket for web hosting
resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket = "${var.bucket_name}-${var.account_id}"

  tags = {
    Public = var.bucket_public_tag
  }
}

resource "aws_s3_bucket_public_access_block" "web_hosting_public_access_block" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_website_configuration" "web_hosting_website" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

# Bucket Policy
resource "aws_s3_bucket_policy" "web_hosting_policy" {
  depends_on = [aws_s3_bucket_public_access_block.web_hosting_public_access_block]
  bucket = aws_s3_bucket.web_hosting_bucket.id

  policy = data.aws_iam_policy_document.web_hosting_policy.json
}

data "aws_iam_policy_document" "web_hosting_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = var.web_hosting_policy_actions

    resources = [
      aws_s3_bucket.web_hosting_bucket.arn, 
      "${aws_s3_bucket.web_hosting_bucket.arn}/*"
    ]
  }
}