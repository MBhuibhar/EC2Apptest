/*data "aws_iam_policy_document" "ecs_assume_policy" {
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
      "${aws_cloudwatch_log_group.this.arn}*",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }

  dynamic "statement" {
    for_each = var.ecr_image == "" ? [1] : []
    content {
      effect = "Allow"
      actions = [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer"
      ]
      resources = [
        aws_ecr_repository.this[0].arn
      ]
    }
  }
}*/

data "aws_availability_zones" "available_az" {
  state = "available"
}

data "aws_vpc" "account_vpc" {
  id = var.vpc_id
}

data "aws_subnets" "private_subnets" {
  for_each = toset(data.aws_availability_zones.available_az.zone_ids)
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "tag:Name"
    values = ["*private*", "*Private*"]
  }

  filter {
    name   = "availability-zone-id"
    values = [each.value]
  }
}

data "aws_ecs_cluster" "this" {
  cluster_name = var.ecs_cluster_name
}

data "external" "ecr_latest_image" {
  program = ["bash", "${path.module}/get-ecr-tag.sh"]

  query = {
    repository_name = local.ecr_repository_name
  }
}

data "aws_security_group" "ecs_sg" {
  name        = var.security_group
  vpc_id      = var.vpc_id
}

data "aws_iam_role" "iam_role_ecs_terraform" {
  name = var.iam_role
}
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
