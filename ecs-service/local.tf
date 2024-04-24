locals {
  ecr_repository_name = "${var.account_id}.dkr.ecr.eu-west-1.amazonaws.com/pite-dldeb-${var.env}-${var.service_name}-ecr-repo"
  global_name = "pite-dldeb-${var.service_name}-${var.env}-debezium-kafka"
  topic_environments = {
    dev   = "deveu"
    stage = "stageeu"
    prod  = "prodeu"
  }
}
