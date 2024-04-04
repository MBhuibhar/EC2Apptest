resource "aws_iam_role" "task_execution_role" {
  name               = "${var.service_name}-ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_policy.json

  inline_policy {
    name   = "module-managed-execution-role-policy"
    policy = data.aws_iam_policy_document.ecs_module_managed_execution_role_policy.json
  }

  dynamic "inline_policy" {
    for_each = var.task_execution_role_policy == "" ? [] : [1]
    content {
      name   = "user-managed-execution-role-policy"
      policy = var.task_execution_role_policy
    }
  }
}

resource "aws_iam_role" "task_role" {
  name               = "${var.service_name}-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_policy.json

  dynamic "inline_policy" {
    for_each = var.task_role_policy == "" ? [] : [1]
    content {
      name   = "task-role-policy"
      policy = var.task_role_policy
    }
  }
}

resource "aws_security_group" "this" {
  name        = "${var.service_name}-service-sg"
  description = "${var.service_name} service sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [data.aws_vpc.account_vpc.cidr_block,
      "10.0.0.0/8",    # DAFs premises connection from Direct Connect
      "160.69.0.0/16", # DAFs premises connection from Direct Connect
      "172.16.0.0/12", # DAFs premises connection from Direct Connect
    "192.168.0.0/16"]  # DAFs premises connection from Direct Connect
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}