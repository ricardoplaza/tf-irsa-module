terraform {
  backend "s3" {
    bucket = "stylesage-infrastructure"
    key    = "stylesage-irsa.tfstate"
    region = "eu-west-1"
  }
}
