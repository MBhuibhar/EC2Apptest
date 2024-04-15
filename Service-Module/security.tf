resource "aws_iam_role" "task_execution_role" {
  name               = "pite-dldeb.${var.env}-ecs-task-execution-role"
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
  name               = "pite-dldeb.${var.env}-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_policy.json

  dynamic "inline_policy" {
    for_each = var.task_role_policy == "" ? [] : [1]
    content {
      name   = "task-role-policy"
      policy = var.task_role_policy
    }
  }
}
