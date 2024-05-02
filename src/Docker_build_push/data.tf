data "aws_ecr_repository" "debezium_repository" {
  name = "pite-dldeb-${var.service_name}-${var.env}-debezium-kafka-service-ecr-repo"
}

data "docker_image" "debezium" {
     name = "pite-dldeb-${var.service_name}-${var.env}-docker-image"
}
data "docker_container" "debezium" {
     name  = "pite-dldeb-${var.service_name}-${var.env}-container"
}
