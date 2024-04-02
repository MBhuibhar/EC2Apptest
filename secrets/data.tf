data "aws_secretsmanager_secret" "secret_masterDB" {
    arn = aws_secretsmanager_secret.secret_masterDB.arn
  
}

data "aws_secretsmanager_secret_version" "creds" {
    secret_id = tolist(data.aws_secretsmanager_secret.secret_masterDB.arn)[0]
}
data "aws_iam_policy_document" "ecs_task_execution_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue"
    ]
    resources = [
      tolist(data.aws_secretsmanager_secrets.gcs_kafka_connect_docdb_user.arns)[0],
      data.aws_secretsmanager_secret.gcs_kafka_secrets.arn
    ]
  }
}
