provider "aws" {
  region = var.region
  assume_role {
   role_arn = var.assume_role
  }

  default_tags {
    tags = {
      Name        = "${var.application}-${var.env}"
      div         = "${var.div}"
      dept        = "${var.dept}"
      contact     = "${var.contact}"
      env         = "${var.env}"
      application = "${var.application}"
      initiator   = "${var.initiator}"
      domain      = "${var.domain}"
      billingcode = "${var.billingcode}"
      eeano       = "${var.eeano}"
    }
  }
}
