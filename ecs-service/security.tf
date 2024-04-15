module "iam_assumable_role" {
    source = "../Service-Module/security.tf"
    output "iam_role_ecs" {
        value = module.service-Module.iam_role
    }
    output "Pull_image" {
        value = module.service-Module.Pull_image_dlake
    }
    output "infra-setup" {
        value = module.serivice-Module.infra-setup-policy
    }
    output "pullecr" {
        value = module.service-Module.pullfromecr
    }
}
