module "iam_role_policy" {
    source = "../Service-Module/iam_role/"
    account_id = {
        default = {
            "dev" = "904626469165" 
            "stage" = "904626469165"
        }
    }
    env = {
        default = {
            "env" = ["deveu",stageeu,prodeu]

        }
    }
}
