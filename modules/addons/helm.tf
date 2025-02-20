
resource "helm_release" "eks_helm_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.9.0"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"

  }

  set {
    name  = "region"
    value = data.aws_region.current.name

  }
  set {
    name  = "vpcId"
    value = var.vpc_id

  }
}

resource "helm_release" "aws-vpc-cni" {
  name       = "aws-vpc-cni"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-vpc-cni"
  namespace  = "kube-system"
  set {
    name  = "serviceAccount.create"
    value = "false"
  }
}





resource "helm_release" "sealed_secrets" {
  name       = "sealed-secrets"
  repository = "https://bitnami-labs.github.io/sealed-secrets"
  chart      = "sealed-secrets"
  version    = "2.17.0"
  namespace  = "kube-system"


  set {
    name  = "fullnameOverride"
    value = "sealed-secrets-controller"
  }

}