env                  = "stage"
service_name         = "sql"
account_id           = "904626469165"
account_name         = "daf-dev-digitaldatalake-stage"
vpc_id               = "vpc-0be9984772fa33a6b"
subnet1              = "subnet-09dacc0e93e6e65e8"
subnet2              = "subnet-0b8d8a23586b6560e"
security_group_id    = "sg-06131c9dad26cbf8c"
aws_region           = "eu-central-1"
sns_topic_name       = "pite-dldeb-dev-ccm-email-notification"
sns_subscriber_name1 = "akshay.kalambe@daftrucks.com"
sns_subscriber_name2 = "milind.bhuibhar@paccar.com"
sns_subscriber_name3 = ""
ecr_image            = "904626469165.dkr.ecr.eu-central-1.amazonaws.com/pite-dldeb-stage-sql-ecr-repo"
fargate_resources    = {
    pite-dldeb_services_SQL_all_service = {
      cpu    = "1024"
      memory = "2048"
}   pite-dldeb_services_MYSQL_all_service = {
      cpu    = "1024"
      memory = "2048"
    }
}    