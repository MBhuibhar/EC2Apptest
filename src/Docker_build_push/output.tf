output "dockerimage" {
   value = docker_image.debezium
}

output "dockercontainer" {
  value = docker_container.debezium
}

output "dockerbuild" {
  value = null_resource.docker_packaging
}
output "debezium_repository" {
  value = data.aws_ecr_repository.debezium_repository.repository_url
}
