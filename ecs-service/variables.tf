####################################
##### Control Variables ############
####################################

variable "account_selector" {
  description = "Select the account we will be working on"
  default = {
    "daf-dev-digitaldatalake-dev" : "904626469165"
    "daf-dev-digitaldatalake-stage" : "904626469165"
  }
}

variable "account_id" {}

variable "vpc_id" {
  type        = string
  description = "VPC Id of the main VPC in the account"
}

variable "fargate_resources" {
  type        = map(any)
  description = "Fargate resources (CPU and memory) for each service"
  default = {
    pite-dldeb_services_SQL_all_service = {
      cpu    = "4096"
      memory = "30720"
    }
    pite-dldeb_services_MYSQL_all_service = {
      cpu    = "4096"
      memory = "30720"
    }

  }
}

##############################################

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

variable "security_group" {}

variable "env" {}

variable "aws_region" {}

variable "service_name" {}

variable "ecr_image" {}

variable "assume_role" {}

variable "iam_role" {}
variable "bucket" {}
