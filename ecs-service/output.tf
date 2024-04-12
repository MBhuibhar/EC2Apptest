output "sql_service_ecr_repo_url" {
  value       = module.pite-dldeb_services_SQL_service.ecr_repository_url
  description = "Db service ECR repository URL"
}

output "sql_service_ecr_repo_arn" {
  value       = module.pite-dldeb_services_SQL_service.ecr_repository_arn
  description = "DB service ECR repository ARN"
}

output "MYSQL_service_ecr_repo_url" {
  value       = module.pite-dldeb_services_MYSQL_service.ecr_repository_url
  description = "DB service ECR repository ARN"

}

output "MYSQL_service_ecr_repo_arn" {
  value = module.pite-dldeb_services_MYSQL_service.ecr_repository_arn
}

output "ecs_role" {
  value = module.service-Module.aws_iam_role.iam_role_ecs_terraform.id
}

