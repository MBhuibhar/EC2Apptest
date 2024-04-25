output "sql_service_ecr_repo_url" {
  value       = module.pite-dldeb-SQL    #ecr_repository_url  #pite-dldeb_services_SQL_service 
  description = "Db service ECR repository URL"
  sensitive = false
}

output "sql_service_ecr_repo_arn" {
  value       = module.pite-dldeb-SQL     #ecr_repository_arn     ##pite-dldeb_services_SQL_service
  description = "DB service ECR repository ARN"
  sensitive = false
}

/*output "secret_value" {
  value = jsondecode(sensitive(data.aws_secretsmanager_secret_version.creds.secret_string))
  sensitive = true
}*/

/*output "cloudwatch_log_group" {
  value       = aws_cloudwatch_log_group.this.name
  description = "The name of the log group"
}*/

/*output "secret_name_valid" {
  value = module.pite-dldeb-SQL      #data.aws_secretsmanager_secret_version.creds.secret_string
}*/
 /*output "ecr_repository_url" {
   value      = data.aws_ecr_repository.ecr_repo.repository_url
}*/
/*output "MYSQL_service_ecr_repo_url" {
  value       = module.pite-dldeb_services_MYSQL_service.ecr_repository_url
  description = "DB service ECR repository ARN"

}

output "MYSQL_service_ecr_repo_arn" {
  value = module.pite-dldeb_services_MYSQL_service.ecr_repository_arn
}*/

/*output "ecs_role" {
  value = module.service-Module.aws_iam_role.iam_role_ecs_terraform.id
}*/

