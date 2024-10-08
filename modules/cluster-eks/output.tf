# EKS outputs

output "endpoint" {
  value       = aws_eks_cluster.eks-cluster.endpoint
  description = "Endpoint do cluster EKS"
}
output "cluster_certificate_authority" {
  value       = aws_eks_cluster.eks-cluster.certificate_authority[0].data
  description = "Certificado do cluster EKS"
}

output "eks_sg_id" {
  value       = aws_eks_cluster.eks-cluster.vpc_config[0].cluster_security_group_id
  description = "ID do security group do cluster EKS"
}

output "oidc" {
  value       = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
  description = "OIDC do cluster"
}

output "cluster_name" {
  value       = aws_eks_cluster.eks-cluster.id
  description = "Nome do cluster EKS"
}