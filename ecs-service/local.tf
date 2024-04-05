locals {
  global_name = "pite-dldeb-${var.service_name}-${var.env}-debezium-kafka"
  topic_environments = {
    dev   = "deveu"
    stage = "stageeu"
    prod  = "prodeu"
  }
}