################################
########Resources tags##########
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


variable "secret_masterDB" {
    description = "database administrator password"
    type = string
    sensitive = true
}

variable "env" {}

variable "db" {}

variable "bucket" {}

variable "key" {}

variable "region" {}

variable "assume_role" {}