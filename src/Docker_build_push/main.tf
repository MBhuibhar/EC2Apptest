   # Configure the Docker
   provider "docker" {
     #host = "unix:///var/run/docker.sock"
   }

   resource "docker_image" "debezium" {
     name         = "pite-dldeb-${var.service_name}-${var.env}-docker-image"
     build {
       context    = "."
       dockerfile = "./container-image/Dockerfile.kafka"
     }
   }

   resource "docker_container" "debezium" {
     name  = "pite-dldeb-${var.service_name}-${var.env}-container"
     image = docker_image.debezium.image_id

     volumes {
       container_path = "/kafka/config"
       #host_path      = "./config/"
       read_only      = true
     }
   }

# Push the Docker image to ECR

/*resource "docker_registry_image" "ecr_push" {
  name          = aws_ecr_repository.debezium_repository.repository_url
  image         = docker_image.debezium_image.latest
  registry_id   = aws_account_id
  repository_name = "debezium-repo"
}*/

resource "null_resource" "docker_packaging" {
	
	  provisioner "local-exec" {
	    command = <<EOF
	    aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.us-west-1.amazonaws.com
	    docker build -t "${data.aws_ecr_repository.debezium_repository.repository_url}"
            docker tag ${data.aws_ecr_repository.debezium_repository}:latest ${var.account_id}.dkr.ecr.us-west-1.amazonaws.com/${data.aws_ecr_repository.debezium_repository}:latest
	    docker push "${data.aws_ecr_repository.debezium_repository.repository_url}:latest"
	    EOF
	  }
	

	  triggers = {
	    "run_at" = timestamp()
	  }
}
	
