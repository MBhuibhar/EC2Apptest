resource "random_password" "password" {
    length = 16
    special = true

}

resource "aws_secretsmanager_secret" "dbUser" {
    name = "pite-dldeb-${var.db}-${var.env}-admin3"
    
}

resource "aws_secretsmanager_secret_version" "dbUser" {
    secret_id = aws_secretsmanager_secret.dbUser.id
    secret_string = <<EOF
    {
        "username": "adminaccount"
        "password": "${random_password.password}"
    }
 EOF   
}
