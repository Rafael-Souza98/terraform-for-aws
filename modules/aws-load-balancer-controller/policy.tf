resource "aws_iam_policy" "eks-controller-policy" {
  name        = "${var.project_name}-AWSLBController"
  description = "Policy of LB Controller"
  path        = "/"
  policy      = file("${path.module}/iam_policy.json")

}