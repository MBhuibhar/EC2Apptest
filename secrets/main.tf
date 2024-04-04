/*resource "random_password" "password" {
    length = 16
    special = true

}*/

resource "aws_secretsmanager_secret" "masterDB" {
    name = "pite-dldeb-${var.db}-${var.env}-admin"
    recovery_window_in_days = 7
    
}

resource "aws_secretsmanager_secret_version" "creds" {
    secret_id = aws_secretsmanager_secret.masterDB.id
    secret_string = jsonencode({
        username = "adminaccount"
        password = "var.db_pass"
    })  
}

output "masterDB" {
  value = aws_secretsmanager_secret.masterDB.id
}

