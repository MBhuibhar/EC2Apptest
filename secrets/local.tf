locals {
  db_cred = jsondecode(data.aws_secretsmanager_secret_version.dbUser.secret_string)
}
