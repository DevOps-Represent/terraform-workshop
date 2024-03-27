variable "bucket_name" {
  type        = string
  description = "The name of the s3 bucket - this must be unique"
}

variable "account_id" {
  type        = string
  description = "The account id of the AWS account"
}

variable "bucket_public_tag" {
  type        = string
  description = "The tag to apply to the bucket add extra information"
  default     = "Testing bucket as part of workshop content"
}

variable "block_public_acls" {
  type        = bool
  description = "Whether to block public ACLs"
  default     = false
}

variable "block_public_policy" {
  type        = bool
  description = "Whether to block public policies"
  default     = false
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether to ignore public ACLs"
  default     = false
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether to restrict public buckets"
  default     = false
}

variable "index_document" {
  type        = string
  description = "The index document for the website"
  default     = "index.html"
  
}

variable "error_document" {
  type        = string
  description = "The error document for the website"
  default     = "error.html"
}

variable web_hosting_policy_actions {
    type        = list(string)
    description = "The actions to allow in the bucket policy"
    default     = ["s3:GetObject"]
}