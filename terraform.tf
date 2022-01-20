terraform {
  backend "s3" {
    bucket               = "stylesage-infrastructure"
    region               = "eu-west-1"
    workspace_key_prefix = "stylesage-infrastructure/irsa"
    key                  = "terraform_state"
    encrypt              = "true"
    dynamodb_table       = "stylesage_terraform_irsa_lock"
  }
}