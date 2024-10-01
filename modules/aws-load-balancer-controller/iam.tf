resource "aws_iam_role" "eks_controller_role" {
  name = "${var.project_name}-LoadBalancer-Controller"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = aws_iam_policy.eks-controller-policy.policy

}