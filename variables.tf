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
    "dev"   = "arn:aws:iam::00000000:role/stylesage-admins"
    "pre"   = "arn:aws:iam::00000000:role/stylesage-admins"
    "pro"   = "arn:aws:iam::00000000:role/stylesage-admins" 
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
    "dev"   = "stylesage_dev:irsaServiceAccount_dev"
    "pre"   = "stylesage_pre:irsaServiceAccount_pre"
    "pro"   = "stylesage_pro:irsaServiceAccount_pro"
  }
}

variable "s3_role_name" {
  type = map
  default = {
    "dev"   = "stylesage_s3_role_dev"
    "pre"   = "stylesage_s3_role_pre"
    "pro"   = "stylesage_s3_role_pro"
  }
}