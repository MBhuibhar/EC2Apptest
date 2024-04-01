locals {
  db_cred = jsondecode(str(data.aws_secretsmanager_secret_version.creds.secret_string))
}
