# S3 bucket for web hosting
resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"
  policy = templatefile("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
