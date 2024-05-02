#ECR Repo (1 time)
#Docker  image (1 time per DB source. thin image)
#ECS Service
#task Definition
#Tasks
#IAM Roles
resource "aws_ecr_repository" "ecr_name" {
  name         = "pite-dldeb-${var.db}-${var.env}-debezium-kafka-service-ecr-repo"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}
output "ecr_name" {
  value = aws_ecr_repository.ecr_name.name
}
