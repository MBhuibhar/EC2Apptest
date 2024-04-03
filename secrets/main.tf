/*resource "random_password" "password" {
    length = 16
    special = true

}*/

resource "aws_secretsmanager_secret" "dbUser" {
    name = "pite-dldeb-${var.db}-${var.env}-admin1"
    
}

resource "aws_secretsmanager_secret_version" "dbUser" {
    secret_id = aws_secretsmanager_secret.dbUser.id
    secret_string = <<EOF
    {
        "username": adminaccount
        "password": var.dbUser
    }
 EOF   
}
