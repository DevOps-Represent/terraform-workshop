terraform {
  required_version = "XXXX"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "XXXX"
    }
  }

  backend "s3" {
    workspace_key_prefix = "[YOUR-NAME]-terraform-workshop"
    region               = "ap-southeast-2"
    bucket               = "[YOUR-NAME]-terraform-workshop-state-bucket-[AWS-ACCOUNT-ID]"
    key                  = "terraform.tfstate"
    use_lockfile         = true
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "global"
}
