variable "bucket_name" {
  type        = string
  description = "The name of the bucket - this must be unique"
}

variable "my_module_1" {
  description = "The configuration for the first bucket"
}

variable "my_module_2" {
  description = "The configuration for the second bucket"
}