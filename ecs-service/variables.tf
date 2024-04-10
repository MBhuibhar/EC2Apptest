####################################
##### Control Variables ############
####################################
variable "account_name" {
  type        = string
  description = "Name of the account we want to deploy to"
}

variable "account_id" {
  description = "Select the account we will be working on"
  default = {
    "dev-datalake-dev"   : "609258630391"
    "dev-datalake-stage" : "609258630391"
  }
}

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

variable "security_group_id" {}

variable "env" {}

variable "aws_region" {}

variable "service_name" {}

variable "ecr_image" {}

variable "assume_role" {}
