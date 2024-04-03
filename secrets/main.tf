/*resource "random_password" "password" {
    length = 16
    special = true

}*/

resource "aws_secretsmanager_secret" "dbUser" {
    name = "pite-dldeb-${var.db}-${var.env}-adminTest"
    recovery_window_in_days = 7
    
}

resource "aws_secretsmanager_secret_version" "dbUser" {
    secret_id = aws_secretsmanager_secret.dbUser.id
    secret_string = jsonencode({
        username = "adminaccount"
        password = "QWe!@#123"
    })  
}
