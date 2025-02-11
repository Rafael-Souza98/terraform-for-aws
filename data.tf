data "aws_iam_roles" "oidc_role" {
  name_regex = ".*rafael-oidc-role.*"
}