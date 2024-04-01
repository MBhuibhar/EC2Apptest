*/locals {
  db_cred = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}*/
