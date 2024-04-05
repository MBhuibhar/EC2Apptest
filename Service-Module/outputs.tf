output "service_arn" {
  value       = aws_ecs_service.this.id
  description = "The ARN of the service created"
}

output "cloudwatch_log_group" {
  value       = aws_cloudwatch_log_group.this.name
  description = "The name of the log group"
}

output "ecr_repository_url" {
  value       = "609258630391.dkr.ecr.eu-central-1.amazonaws.com/pite-dldeb-${var.dev}-${var.service_name}-ecr-repo:latest" : var.ecr_image
  description = "ECR repository URL, either the provided one or the managed one"
}

output "ecr_repository_arn" {
  value       = var.ecr_image == "" ? "local.ecr_repository_name.arn" : ""
  description = "If managed, the ARN of the ECR repository"
}
