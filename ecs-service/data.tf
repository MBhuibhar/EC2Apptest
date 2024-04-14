data "aws_iam_policy" "SecretsManagerReadWrite" {
  arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

data "aws_iam_policy" "AmazonSQSFullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

data "aws_iam_policy" "CloudWatchAgentServerPolicy" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

data "aws_iam_policy" "AmazonSNSFullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}
data "aws_iam_role" "iam_role_ecs_terraform" {
  name = var.iam_role
}
data "aws_iam_policy" "pite-dldeb-Pull_image_dlake" {
  name = "pite-dldeb-${var.env}-Pull_image_dlake"
}
data "aws_iam_policy" "pite-dldeb-infra-setup-policy" {
  name = "pite-dldeb-${var.env}-infra-setup-policy"
}
data "aws_iam_policy" "pite-dldeb-pullfromecr" {
  name = "pite-dldeb-${var.env}-pullfromecr"
}

/*data "aws_secretsmanager_secret" "masterDB" {
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
    values = ["pite-dldeb-${var.service_name}-${var.env}-admin"]
  }
}*/
