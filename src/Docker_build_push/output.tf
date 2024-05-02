output "dockerimage" {
   value = docker_image.debezium
}

output "dockercontainer" {
  value = docker_container.debezium
}

output "dockerbuild" {
  value = null_resource.docker_packaging
}
