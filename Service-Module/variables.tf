#########################################
######### Service parameters ############
#########################################

variable "service_name" {
  type        = string
  description = "Name for the service components in the format required by the tagset, the name will be trimed to 32 characters"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster that will be used to deploy the service"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the service will be placed"
}

variable "env" {}

variable "db" {
  description = "Service name"
  type = string
  default = ""
}

variable "account_id" {
  type = string
  description = "AWS Account id"
}
#########################################
####### Autoscaling parameters ##########
#########################################

variable "min_service_replicas" {
  type        = number
  description = "Minimum number of replicas to spin up the service"
  default     = 1
}

variable "max_service_replicas" {
  type        = number
  description = "Maximum number of replicas to spin up the service"
  default     = 1
}

#########################################
### Container definiton parameters ######
#########################################
variable "ecr_image" {
  type        = string
  description = "Repository URL of the ECR image to deploy with tag, if not will be managed by the module"
  default     = ""
}

variable "container_environment_variables" {
  type        = list(map(string))
  description = "A list of maps with the environment variables, each map should have the key 'name' and the value 'value'"
  default     = []
}

variable "container_secrets" {
  type        = list(map(string))
  description = "A list of maps with environment variables took from Secrets Manager, each map should have the key 'name' and the value 'valueFrom'. This value shold come in the standard format"
  default     = []
}

variable "container_port" {
  type        = number
  description = "Port mapped to the container"
  default     = 80
}

variable "container_traffic_protocol" {
  type        = string
  description = "Protocol from which the container receives traffic"
  default     = "http"
}

variable "service_healthcheck_block" {
  type        = string
  description = "Map with the healthcheck configuration"
  default     = "{}"
}

variable "command_override" {
  type        = list(string)
  description = "Command to send to the container to run"
  default     = []
}

#########################################
##### Task definition parameters ########
#########################################

variable "cpu" {
  type        = string
  description = "Fargate instance CPU units to provision"
  default     = "4096"
}

variable "memory" {
  type        = string
  description = "Fargate instance Memory units to provision"
  default     = "30720"
}

#########################################
####### IAM policies in string ##########
#########################################

variable "task_execution_role_policy" {
  type        = string
  description = "Execution role policy, this policy conatins the permissions that the service will assume to fetch secrets or ECR images"
  default     = ""
}

variable "task_role_policy" {
  type        = string
  description = "Role that the task will assume to perform application related actions, like interaction with other AWS services."
  default     = ""
}

variable "env" {
  type        = string
  description = "Environment"
  default     = ""
}
