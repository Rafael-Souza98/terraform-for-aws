# EKS outputs

output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}
output "cluster_certificate_authority" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}

output "eks_sg_id" {
  value = aws_eks_cluster.eks-cluster.vpc_config[0].cluster_security_group_id
}

output "oidc" {
  value = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}

output "cluster_name" {
  value = aws_eks_cluster.eks-cluster.id
}