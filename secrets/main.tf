/*resource "random_password" "password" {
    length = 16
    special = true

}*/

resource "aws_secretsmanager_secret" "masterDB" {
    name = "pite-dldeb-${var.db}-${var.env}-debezium-kafka-service3"
    recovery_window_in_days = 7
    
}

resource "aws_secretsmanager_secret_version" "creds" {
    secret_id = aws_secretsmanager_secret.masterDB.id
    secret_string = jsonencode({
        username = "var.dbuser"
        password = var.db_pass
    })  
    lifecycle {
      ignore_changes = [ secret_string ]
    }
}

output "masterDB" {
  value = aws_secretsmanager_secret.masterDB.name
}

