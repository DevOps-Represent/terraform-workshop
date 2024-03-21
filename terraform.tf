terraform {
  required_version = "XXXX"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "XXXX"
    }
  }

  backend "s3" {
    workspace_key_prefix = "[YOUR-NAME]-devops-represent-terraform-workshop"
  }

}



provider "aws" {
  region = "ap-southeast-2"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "global"
}
