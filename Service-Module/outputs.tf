output "service_arn" {
  value       = aws_ecs_service.this.id
  description = "The ARN of the service created"
}

output "cloudwatch_log_group" {
  value       = aws_cloudwatch_log_group.this.name
  description = "The name of the log group"
}

output "ecr_repository_url" {
  value       = local.aws_ecr_repository == "" ? "${local.ecr_repository_name.repository_url}:latest" : local.aws_ecr_repository #var.ecr_image
  description = "ECR repository URL, either the provided one or the managed one"
}

output "ecr_repository_arn" {
  value       = local.aws_ecr_repository == "" ? local.ecr_repository_name.arn : ""   #var.ecr_image
  description = "If managed, the ARN of the ECR repository"
}
