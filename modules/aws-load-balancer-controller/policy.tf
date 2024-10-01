resource "aws_iam_policy" "eks-controller-policy" {
  name        = "${var.project_name}-aws-loadbalancer-controller"
  description = "Policy of LB Controller"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("${path.module}/iam_policy.json")
}