################################################
# Terraform Statefile location details
################################################

terraform {
  backend "s3" {
    bucket = var.bucket
    region = var.region
    key    = var.key
  }

}