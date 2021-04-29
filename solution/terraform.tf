terraform {
  required_version = "~> 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37"
    }
  }

  backend "s3" {
    workspace_key_prefix = "devops-girls-terraform-workshop"
  }

}



provider "aws" {
  region = "ap-southeast-2"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "global"
}
