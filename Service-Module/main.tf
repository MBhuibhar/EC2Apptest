/*module "ecr_repository_name" {
  source = "../infra/terraform/"
}
output "module_ecr_repository_url" {
  value = module.ecr_repository_name.ecr_repository_url
}*/

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/ecs/${var.service_name}-logs"
  retention_in_days = 180
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.service_name
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.task_role.arn
  container_definitions    = jsonencode([local.container_definition])

}

resource "aws_ecs_service" "this" {
  #depends_on             = [aws_iam_role.task_role]
  name                   = var.service_name
  cluster                = local.aws_ecs_cluster_arn      #data.aws_ecs_cluster.this.arn
  task_definition        = aws_ecs_task_definition.this.arn
  desired_count          = var.min_service_replicas
  launch_type            = "FARGATE"
  force_new_deployment   = true
  enable_execute_command = true
  propagate_tags         = "SERVICE"

  network_configuration {
    subnets         = compact(local.private_subnet_ids)
    security_groups = [local.security_group_id]
  }
}
