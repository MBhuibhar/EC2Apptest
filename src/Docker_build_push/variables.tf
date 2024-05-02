variable "account_selector" {
  description = "Select the account we will be working on"
  default = {
    "dev"   : "904626469165"
    "stage" : "904626469165"
    "prod"  : ""
  }
}
#variable "db" {}

variable "env" {}

variable "key" {}

variable "region" {}

variable "bucket" {}

variable "assume_role" {}

variable "account_id" {}

variable service_name {}

#################################################################
#Resource Tags
#################################################################


variable "div" {
  description = "division"
  default     = "54"
}

variable "dept" {
  description = "Name of Departmnet for tagging "
  default     = "53200"
}

variable "contact" {
  description = "Name of contact for tagging "
  default     = "daftruckseindhoven-glbamsdata@daftrucks.com"
}

variable "application" {
  description = "Name of application for tagging "
  default     = "datalake debezium ecs"
}

variable "initiator" {
  description = "Name of initiator for tagging "
  default     = "akshay.kalambe@daftrucks.com"
}

variable "domain" {
  description = "Name of domain for tagging "
  default     = "paccar it europe"
}

variable "billingcode" {
  description = "Name of billingcode for tagging "
  default     = "53200"
}

variable "eeano" {
  description = "Name of eeano for tagging "
  default     = ""
}
