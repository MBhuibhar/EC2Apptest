output "service_arn" {
  value       = aws_ecs_service.this.id[0]
  description = "The ARN of the service created"
}

output "cloudwatch_log_group" {
  value       = aws_cloudwatch_log_group.this.name
  description = "The name of the log group"
}

output "ecr_repository_url" {
  value       = local.aws_ecr_repository == "" ? "${local.ecr_repository_name}:latest" : local.aws_ecr_repository #var.ecr_image #local.ecr_repository_name.repository_url
  description = "ECR repository URL, either the provided one or the managed one"
}

output "ecr_repository_arn" {
  value       = local.aws_ecr_repository == "" ? local.ecr_repository_name : ""   #var.ecr_image #ecr_repository_name.arn
  description = "If managed, the ARN of the ECR repository"
}
output "secret_value" {
  value = jsondecode(sensitive(data.aws_secretsmanager_secret_version.creds.secret_string))
  sensitive = true
}
