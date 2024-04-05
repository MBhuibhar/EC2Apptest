locals {
  ecr_repository_name = module.aws_ecr_repository.ecr_name
  ecr_latest_image    = data.external.ecr_latest_image.result.image_tag == "" ? "latest" : data.external.ecr_latest_image.result.image_tag
  container_definition = {
    name        = var.service_name
    image       = var.ecr_image == "" ? "${aws_ecr_repository.this[0].repository_url}:${local.ecr_latest_image}" : var.ecr_image
    command     = var.command_override
    environment = var.container_environment_variables
    secrets     = var.container_secrets
    healthCheck = jsondecode(var.service_healthcheck_block)

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.this.name
        awslogs-region        = "eu-central-1"
        awslogs-stream-prefix = "ecs"
      }
    }

    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
      protocol      = var.container_traffic_protocol
    }]
  }
  private_subnet_ids = [for k, v in data.aws_subnets.private_subnets : length(v.ids) > 0 ? v.ids[0] : ""]
}
/*locals {
  env = "dev"
  dev = {             
  security_group  = data.aws_security_group.ecs_dev_sg.name                     #need to set condition for prod
  vpc_id          = "vpc-0be9984772fa33a6b"                                      #need to check condition for prod
  private_subnet1 = "subnet-09dacc0e93e6e65e8"
  private_subnet2 = "subnet-0b8d8a23586b6560e"
  aws-aws_region  = "eu-central-1"
  }
}
locals {
  env  = "prod"
  prod = {
  security_group  = data.aws_security_group.ecs_prod_sg.name                     
  vpc_id          = ""                                      
  private_subnet1 = ""
  private_subnet2 = ""
  aws-aws_region  = "eu-central-1"
  }
}*/

