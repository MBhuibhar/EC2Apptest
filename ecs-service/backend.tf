################################################
# Terraform Statefile location details
################################################

terraform {
  backend "s3" {
    bucket = var.bucket
    region = var.aws_region
    key    = var.key
  }

}