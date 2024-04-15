module "iam_role_policy" {
    source = "../Service-Module/iam_role/"
    account_id = ""
    env = ""
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
