locals {
  ecr_repository_name = "${var.service_name}-${var.env}repo"
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