data "aws_secretsmanager_secret" "secret_masterDB" {
    arn = aws_secretsmanager_secret.secret_masterDB.arn
  
}

data "aws_secretsmanager_secret_version" "creds" {
    secret_id = data.aws_secretsmanager_secret.secret_masterDB.arn
}