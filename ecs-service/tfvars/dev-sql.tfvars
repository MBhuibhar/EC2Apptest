env                  = "dev"
service_name         = "sql"
account_id           = "609258630391"
account_name         = "daf-dev-digitaldatalake-dev"
vpc_id               = "vpc-0be9984772fa33a6b"
#subnet1              = "subnet-09dacc0e93e6e65e8"
#subnet2              = "subnet-0b8d8a23586b6560e"
security_group_id    = "sg-06131c9dad26cbf8c"
aws_region           = "eu-central-1"
#sns_topic_name       = "pite-dldeb-dev-ccm-email-notification"
#sns_subscriber_name1 = "akshay.kalambe@daftrucks.co"
#sns_subscriber_name2 = "milind.bhuibhar@paccar.com"
#sns_subscriber_name3 = ""
ecr_repo            = "609258630391.dkr.ecr.eu-central-1.amazonaws.com/pite-dldeb-dev-sql-ecr-repo"
assume_role          = ""
fargate_resources    = {
    pite-dldeb_services_SQL_all_service = {
      cpu    = "4096"
      memory = "30720"
}   
pite-dldeb_services_MYSQL_all_service = {
      cpu    = "4096"
      memory = "30720"
    }
}
