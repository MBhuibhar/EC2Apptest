resource "random_password" "password" {
    length = 16
    special = true

}

resource "aws_secretsmanager_secret" "secret_masterDB" {
    name = "pite-dldeb-${var.db}-${var.env}-admin"
    
}

resource "aws_secretsmanager_secret_version" "creds" {
    secret_id = aws_secretsmanager_secret.secret_masterDB.id
    secret_string = <<EOF
    {
        "username": "adminaccount"
        "password": "random_password.password.result"
    }
 EOF   
}
