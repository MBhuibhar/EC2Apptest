################################
########Resources tags##########
variable "div" {
  description = "division"
  default     = "54"
}

variable "dept" {
  description = "Name of Departmnet for tagging "
  default     = "53"
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
  default     = "53"
}

variable "eeano" {
  description = "Name of eeano for tagging "
  default     = ""
}


variable "db_pass" {
    #description = "database administrator password"
    #type = string
    #sensitive = true
}

variable "env" {}

variable "db" {}

variable "bucket" {}

variable "key" {}

variable "region" {}

variable "assume_role" {}
variable "dbuser" {}
