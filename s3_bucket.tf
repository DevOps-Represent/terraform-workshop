# S3 bucket for web hosting
resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket = "XXXX"
  acl    = "XXXX"

  website {
    index_document = "XXXX"
    error_document = "XXXX"
  }

  tags = {
    Public = "Testing bucket as part of workshop content"
  }
}

resource "aws_s3_bucket_policy" "web_hosting_policy" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid       = "XXXX"
        Effect    = "XXXX"
        Principal = "*"
        Action    = "XXXX"
        Resource = [
          XXXX,
          "XXXX/*",
        ]
      },
    ]
  })
}
