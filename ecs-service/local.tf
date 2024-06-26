locals {
  ecr_repository_name = "${var.account_id}.dkr.ecr.eu-west-1.amazonaws.com/${local.global_name}-service-ecr-repo"
  global_name = "pite-dldeb-${var.service_name}-${var.env}-debezium-kafka"
  topic_environments = {
    dev   = "deveu"
    stage = "stageeu"
    prod  = "prodeu"
  }
  dbsecret_name = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.creds.secret_string)) 
}
