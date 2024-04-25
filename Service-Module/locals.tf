locals {
  ecr_repository_name = local.aws_ecr_repository
  ecr_latest_image    = local.aws_ecr_repository == "" ? "latest" : local.aws_ecr_repository
  container_definition = {
    name        = var.service_name
    image       = local.aws_ecr_repository == "" ? "${local.ecr_repository_name}:${local.ecr_latest_image}" : local.aws_ecr_repository   #var.ecr_image #local.ecr_repository_name.repository_url
    command     = var.command_override
    environment = var.container_environment_variables
    secrets     = var.container_secrets
    healthCheck = jsondecode(var.service_healthcheck_block)

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.this.name
        awslogs-region        = "eu-west-1"  #eu-central-1
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
locals {
  role_arn = "arn:aws:iam::aws:role/pite-dldeb-${var.env}-ecs-iam-role"
}
locals {
  security_group_id = var.security_group
}
locals {
  aws_ecr_repository = var.ecr_image   #data.aws_ecr_repository.ecr_repo
}
locals {
   aws_ecs_cluster_arn = var.ecs_cluster_name
}
locals {
   validate_secret_name = data.aws_secretsmanager_secret_version.creds.secret_string
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
