data "aws_iam_policy_document" "ecs_assume_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ecs_module_managed_execution_role_policy" {
  /*statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "${aws_cloudwatch_log_group.this.arn}*",
    ]
  }*/

  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }

  statement {
      effect = "Allow"
      actions = [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer"
      ]
      resources = [
        local.ecr_repository_name      #aws_ecr_repository.this[0].arn
      ]
  }
}

/*data "aws_ecr_repository" "ecr_repo" {
  name = "${var.service_name}-ecr-repo"
}*/
/*output "ecr_repo_name" {
  value = aws_ecr_repository_ecr_repo.repository_url
}*/
/*data "aws_iam_role" "iam_role_ecs_terraform" {
  name = var.iam_role
}
data "aws_iam_policy" "pite-dldeb-Pull_image_dlake" {
  name = "arn:aws:iam::aws:policy/pite-dldeb-${var.env}-Pull_image_dlake"
}
data "aws_iam_policy" "pite-dldeb-infra-setup-policy" {
  name = "arn:aws:iam::aws:policy/pite-dldeb-${var.env}-infra-setup-policy"
}
data "aws_iam_policy" "pite-dldeb-pullfromecr" {
  name = "arn:aws:iam::aws:policy/pite-dldeb-${var.env}-pullfromecr"
}*/

/*data "aws_iam_policy_document" "ecs_task_execution_role_policy" {
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
data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.masterDB.arn
}
/*data "aws_secretsmanager_secrets" "masterDB" {
  arns = "arn:aws:secretsmanager:eu-west-1:609258630391:secret:pite-dldeb-sql-dev-admin-gVmT1J"
}*/
data "aws_secretsmanager_secret" "masterDB" {
  name = "pite-dldeb-${var.service_name}-${var.env}-debezium-kafka-service3" #Name or Arn #secret_id
}
data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = var.bucket
    key    = "secret/tfstate/${var.env}/${var.env}-${var.service_name}-secret-admin.tfstate"
    region = "eu-central-1"
  }
}
