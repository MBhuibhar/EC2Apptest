data "aws_ecr_repository" "debezium_repository" {
  name = "pite-dldeb-${var.service_name}-${var.env}-debezium-kafka-service-ecr-repo"
}