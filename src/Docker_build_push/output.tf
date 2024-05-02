output "dockerimage" {
   value = docker_image.debezium
}

output "dockercontainer" {
  value = docker_container.debezium.image_id
}

output "dockerbuild" {
  value = null_resource.docker_packaging
}
