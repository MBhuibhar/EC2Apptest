/*variable "account_name" {
  type        = string
  description = "Name of the account we want to deploy to"
}*/

variable "account_selector" {
  description = "Select the account we will be working on"
  default = {
    "dev"   : "609258630391"
    "stage" : "609258630391"
    "prod"  : ""
  }
}
#variable "db" {}

variable "env" {}

variable "aws_region" {
  default = eu-west-1
  type    = string
}

variable "key" {}

variable "region" {}

variable "bucket" {}

variable "assume_role" {}

#variable "account_id" {}

#################################################################
#Resource Tags
#################################################################


variable "div" {
  description = "division"
  default     = "05"
}

variable "dept" {
  description = "Name of Departmnet for tagging "
  default     = "532"
}

variable "contact" {
  description = "Name of contact for tagging "
  default     = ""
}

variable "application" {
  description = "Name of application for tagging "
  default     = "ecs"
}

variable "initiator" {
  description = "Name of initiator for tagging "
  default     = ""
}

variable "domain" {
  description = "Name of domain for tagging "
  default     = ""
}

variable "billingcode" {
  description = "Name of billingcode for tagging "
  default     = "532"
}

variable "eeano" {
  description = "Name of eeano for tagging "
  default     = ""
}
