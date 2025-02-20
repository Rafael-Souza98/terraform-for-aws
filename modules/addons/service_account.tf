resource "kubernetes_service_account" "serviceAccount-loadbalancer-controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_controller_role.arn
    }
  }

}


resource "kubernetes_service_account" "serviceAccount-aws-vpc-cni" {
  metadata {
    name      = "aws-node"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.aws_vpc_cni_role.arn
    }
  }

}
