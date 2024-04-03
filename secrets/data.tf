data "aws_secretsmanager_secret" "masterDB" {
    arn = aws_secretsmanager_secret.masterDB.arn
  
}

data "aws_secretsmanager_secret_version" "creds" {
    secret_id = data.aws_secretsmanager_secret.masterDB.id
}

data "aws_iam_policy_document" "ecs_task_execution_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue"
    ]
    resources = [
      data.aws_secretsmanager_secret.masterDB.arn
    ]
  }
}

data "aws_secretsmanager_secrets" "masterDB" {
  filter {
    name   = "name"
    values = ["pite-dldeb-${var.db}-${var.env}-admin"]
  }
}

/*data "aws_secretsmanager_secret_version" "dbUser" {
  secret_id = data.aws_secretsmanager_secrets.dbUser.id
}*/

/*data "aws_secretsmanager_secret" "gcs_kafka_secrets" {
  name = "gcs-vds-${var.env}-kafka-secrets"
}

data "aws_secretsmanager_secret_version" "gcs_kafka_secrets" {
  secret_id = data.aws_secretsmanager_secret.gcs_kafka_secrets.arn
}*/
