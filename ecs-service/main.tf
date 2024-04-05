#ECR Repo (1 time)
#Docker  image (1 time per DB source. thin image)
#ECS Service
#task Definition
#Tasks
#IAM Roles
module "pite-dldeb_services_SQL_service" {
  source                         = "./Service-Module/"
  service_name                   = "${local.global_name}-sql-service"
  ecs_cluster_name               = "${var.account_name}-${var.env}-cluster"
  vpc_id                         = var.vpc_id
  container_port                 = 8083
  cpu                            = var.pite-dldeb_services_SQL_all_service.cpu
  memory                         = var.pite-dldeb_services_SQL_all_service.memory
  task_role_policy               = data.aws_iam_role.iam_role_ecs_terraform.name
  task_execution_role_policy     = data.aws_iam_role.iam_role_ecs_terraform.name
  container_traffic_protocol     = "tcp"

  container_environment_variables = [
    {
      name  = "CONNECT_BOOTSTRAP_SERVERS"
      value = "${bootstrap_server}"
    },
    /*{
      name  = "CONNECT_GROUP_ID"
      value = "$confluent_svc_acc-debezium-connect-group-id-""$db"-"$deployment_version"
    },
    {
      name  = "CONNECT_OFFSET_STORAGE_TOPIC"
      value = "kt_gcs_${local.topic_environments[var.env]}_vehicle-data-services_fms_s3-configs_1"
    },
    {
      name  = "CONNECT_OFFSET_STORAGE_TOPIC"
      value = "$offsets_topic_dkr"
    },
    {
      name  = "CONNECT_STATUS_STORAGE_TOPIC"
      value = "$status_topic_dkr"
    },
    {
      name  = "CONNECT_CONFIG_STORAGE_TOPIC"
      value = "$configs_topic_dkr"
    },
    {
      name  = "KAFKA_HEAP_OPTS"
      value = "-Xms1G -Xmx${kafka_heap_opts}G"
    },
    {
      name  = "CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR"
      value = "$config_replication_factor_dkr"
    },
    {
      name  = "CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR"
      value = "$offset_replication_factor_dkr"
    },
    {
      name  = "CONNECT_STATUS_STORAGE_REPLICATION_FACTOR"
      value = "$status_replication_factor_dkr"
    },
    {
      name  = "CONNECT_OFFSET_FLUSH_INTERVAL_MS"
      value = "$flush_interval_dkr"
    },
    {
      name  = "CONNECT_OFFSET_FLUSH_TIMEOUT_MS"
      value = "$flush_timeout_dkr"
    },
    {
      name  = "CONNECT_KEY_CONVERTER_SCHEMA_REGISTRY_URL"
      value = "$schema_registry_url"
    },
    {
      name  = "CONNECT_VALUE_CONVERTER_SCHEMA_REGISTRY_URL"
      value = "$schema_registry_url"
    },
    {
      name  = "CONNECT_KEY_CONVERTER"
      value = "io.confluent.connect.avro.AvroConverter"
    },
    {
      name  = "CONNECT_VALUE_CONVERTER"
      value = "io.confluent.connect.avro.AvroConverter"
    },
    {
      name  = "CONNECT_REQUEST_TIMEOUT_MS"
      value = "20000"
    },
    {
      name  = "CONNECT_RETRY_BACKOFF_MS"
      value = "500"
    },
    {
      name  = "CONNECT_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM"
      value = "https"
    },
    {
      name  = "CONNECT_SASL_MECHANISM"
      value = "PLAIN"
    },
    {
      name  = "CONNECT_SECURITY_PROTOCOL"
      value = "SASL_SSL"
    },
    {
      name  = "CONNECT_SASL_JAAS_CONFIG"
      value = "'org.apache.kafka.common.security.plain.PlainLoginModule required username=""'$confluent_username'" password="'$confluent_password'"
    },
    {
      name  = "CONNECT_CONSUMER_SECURITY_PROTOCOL"
      value = "SASL_SSL"
    },
    {
      name  = "CONNECT_CONSUMER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM"
      value = "https"
    },
    {
      name  = CONNECT_CONSUMER_SASL_MECHANISM
      value = "PLAIN"
    },
    {
      name  = CONNECT_CONSUMER_SASL_JAAS_CONFIG
      value = "'org.apache.kafka.common.security.plain.PlainLoginModule required username=""'$confluent_username'" password="'$confluent_password'"  
    },
    {
      name  = CONNECT_CONSUMER_REQUEST_TIMEOUT_MS
      value = "20000"
    },
    {
      name  = CONNECT_CONSUMER_RETRY_BACKOFF_MS
      value = "500"
    },
    {
      name  = CONNECT_PRODUCER_SECURITY_PROTOCOL
      value = "SASL_SSL"  
    },
    {
      name  = CONNECT_PRODUCER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM
      value = "https"
    },
    {
      name  = CONNECT_PRODUCER_SASL_MECHANISM
      value = "PLAIN"  
    },
    {
      name  = CONNECT_PRODUCER_SASL_JAAS_CONFIG
      value = "'org.apache.kafka.common.security.plain.PlainLoginModule required username=""'$confluent_username'" password="'$confluent_password'"
    },
    {
      name  = CONNECT_PRODUCER_REQUEST_TIMEOUT_MS
      value = "20000"  
    },
    {
      name  = CONNECT_PRODUCER_RETRY_BACKOFF_MS
      value = "500"  
    },
    {
      name  = CONNECT_LOG4J_APPENDER_STDOUT_LAYOUT_CONVERSIONPATTERN
      value = "[%d] %p %X{connector.context}%m (%c:%L)%n"  
    },
    {
      name  = CONNECT_CUB_KAFKA_TIMEOUT
      value = "300"  
    },
    {
      name  = CONNECT_REST_ADVERTISED_HOST_NAME
      value = "localhost"  
    },
    {
      name  = CONNECT_REST_PORT
      value = "8083"  
    },
    {
      name  = CONNECT_LOG4J_ROOT_LOGLEVEL
      value = "INFO"
    },
    {
      name  = ENV CONNECT_LOG4J_LOGGERS
      value = "org.apache.kafka.connect.runtime.rest=WARN,org.reflections=ERROR"
    },
    {
      name  = ENV CONNECT_PLUGIN_PATH
      value = "/usr/share/java,/usr/share/confluent-hub-components/"  
    },*/
  ]

  container_secrets = [
    {
      name      = "CONNECT_BOOTSTRAP_SERVERS"
      valueFrom = "${data.aws_secretsmanager_secret.gcs_kafka_secrets.arn}:daf_kafka_bootstrap_server::"
    },
    {
      name      = "CONNECT_CONFLUENT_LICENSE"
      valueFrom = "${data.aws_secretsmanager_secret.gcs_kafka_secrets.arn}:daf_confluent_license::"
    }
  ]

  service_healthcheck_block = jsonencode({
    command     = ["CMD-SHELL", "curl localhost:8083 || exit 1"]
    retries     = 5
    startPeriod = 300
    interval    = 30
    timeout     = 5
  })

}

module "pite-dldeb_services_MYSQL_service" {
  source                         = "./Service-Module/"
  service_name                   = "${local.global_name}-dldeb-mysql-service"
  ecs_cluster_name               = "${var.account_name}-${var.env}-cluster"
  vpc_id                         = var.vpc_id
  container_port                 = 8083
  cpu                            = var.fargate_resources.pite-dldeb_services_MYSQL_all_service.cpu
  memory                         = var.fargate_resources.pite-dldeb_services_MYSQL_all_service.memory
  task_role_policy               = data.aws_iam_role.iam_role_ecs_terraform.name
  task_execution_role_policy     = data.aws_iam_role.iam_role_ecs_terraform.name
  alb_healthcheck_interval       = 300
  container_traffic_protocol     = "tcp"

  container_environment_variables = [
    {
      name  = "TOPIC_ENV"
      value = local.topic_environments[var.env]
    },
    {
      name  = "ENV"
      value = var.env
    }
  ]

  container_secrets = [
    {
      name      = "DAF_KAFKA_BOOTSTRAP_SERVER"
      valueFrom = "${data.aws_secretsmanager_secret.gcs_kafka_secrets.arn}:daf_kafka_bootstrap_server::"
    },
    {
      name      = "DAF_KAFKA_S3SINK_SVC_ACCOUNT"
      valueFrom = "${data.aws_secretsmanager_secret.gcs_kafka_secrets.arn}:daf_kafka_s3sink_service_account::"
    },
    {
      name      = "DAF_KAFKA_S3SINK_USERNAME"
      valueFrom = "${data.aws_secretsmanager_secret.gcs_kafka_secrets.arn}:daf_kafka_s3sink_username::"
    },
    {
      name      = "DAF_KAFKA_S3SINK_PASSWORD"
      valueFrom = "${data.aws_secretsmanager_secret.gcs_kafka_secrets.arn}:daf_kafka_s3sink_password::"
    }
  ]

  service_healthcheck_block = jsonencode({
    command     = ["CMD-SHELL", "echo 'Healthy'"]
    retries     = 5
    startPeriod = 300
    interval    = 30
    timeout     = 5
  })

}
