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
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "${aws_cloudwatch_log_group.ecs_logs.arn}*",
    ]
  }

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
  name = "pite-dldeb-${var.env}-${var.service_name}-ecr-repo"
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
}
data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.masterDB.arn
}*/
