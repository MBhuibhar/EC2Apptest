locals {
  db_cred = jsondecode(data.aws_secretsmanager_secret_version.masterDB.secret_string)
}
