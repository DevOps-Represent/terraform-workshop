# S3 bucket for web hosting
resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket = "${var.bucket_name}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Public = "Testing bucket as part of workshop content"
  }
}

resource "aws_s3_bucket_public_access_block" "web_hosting_public_access_block" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "web_hosting_website" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

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

    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.web_hosting_bucket.arn, 
      "${aws_s3_bucket.web_hosting_bucket.arn}/*"
      ]
  }
}