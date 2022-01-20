variable "aws_region" {
  type = map
  default = {
    "dev"   = "eu-west-1"
    "pre"   = "eu-west-1"
    "pro"   = "us-east-1"
  }
}

variable "assume_role" {
  type = map
  default = {
    "dev"   = "arn:aws:iam::00000000:role/ricardoplaza-admins"
    "pre"   = "arn:aws:iam::00000000:role/ricardoplaza-admins"
    "pro"   = "arn:aws:iam::00000000:role/ricardoplaza-admins" 
  }
}

variable "aws_account" {
  type = map
  default = {
    "dev"   = "000000000"
    "pre"   = "000000000"
    "pro"   = "000000000"
  }
}

variable "oidc_serviceAccount" {
  type = map
  default = {
    "dev"   = "ricardoplaza_dev:irsaServiceAccount_dev"
    "pre"   = "ricardoplaza_pre:irsaServiceAccount_pre"
    "pro"   = "ricardoplaza_pro:irsaServiceAccount_pro"
  }
}

variable "s3_role_name" {
  type = map
  default = {
    "dev"   = "ricardoplaza_s3_role_dev"
    "pre"   = "ricardoplaza_s3_role_pre"
    "pro"   = "ricardoplaza_s3_role_pro"
  }
}