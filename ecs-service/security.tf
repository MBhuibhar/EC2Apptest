# #################################################################
# # AWS IAM role policy attachment
# #################################################################

resource "aws_iam_role_policy_attachment" "SecretsManagerReadWrite" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.SecretsManagerReadWrite.arn
}

resource "aws_iam_role_policy_attachment" "AmazonSQSFullAccess" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.AmazonSQSFullAccess.arn
}

resource "aws_iam_role_policy_attachment" "CloudWatchAgentServerPolicy" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.CloudWatchAgentServerPolicy.arn
}

resource "aws_iam_role_policy_attachment" "AmazonSNSFullAccess" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = data.aws_iam_policy.AmazonSNSFullAccess.arn
}

resource "aws_iam_role_policy_attachment" "Pull_image_dlake" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = aws_iam_policy.pite-dldeb-Pull_image_dlake.arn
}

resource "aws_iam_role_policy_attachment" "pite-dldeb-infra-setup-policy_dlake" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = aws_iam_policy.pite-dldeb-infra-setup-policy.arn
}

resource "aws_iam_role_policy_attachment" "pite-dldeb-pullfromecr_dlake" {
  role       = aws_iam_role.iam_role_ecs_terraform.name
  policy_arn = aws_iam_policy.pite-dldeb-pullfromecr.arn
}
