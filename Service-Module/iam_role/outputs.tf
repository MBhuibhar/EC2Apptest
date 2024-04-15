output "iam_role_id" {
  value = aws_iam_role.iam_role_ecs_terraform.name
}

output "Pull_image_dlake" {
  value = aws_iam_policy.pite-dldeb-Pull_image_dlake.arn
}
output "infra-setup-policy" {
  value = aws_iam_policy.pite-dldeb-infra-setup-policy.arn
}
output "pullfromecr" {
  value = aws_iam_policy.pite-dldeb-pullfromecr.arn
}
