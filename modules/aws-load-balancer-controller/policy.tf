resource "aws_iam_policy" "eks-controller-policy" {
  name        = "${var.project_name}-aws-loadbalancer-controller"
  description = "Policy of LB Controller"

  policy = file("${path.module}/iam_policy.json")
}