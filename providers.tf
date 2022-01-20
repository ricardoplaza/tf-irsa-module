terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.56"
    }
  }
}

provider "aws" {
  region  = var.aws_region[terraform.workspace]
  assume_role {
    role_arn = var.assume_role[terraform.workspace]
  }
}
