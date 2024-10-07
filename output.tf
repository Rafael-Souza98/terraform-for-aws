output "endpoint" {
  value = module.cluster_eks.endpoint
}

output "eks_sg_id" {
  value = module.cluster_eks.eks_sg_id
}

output "oidc" {
  value = module.cluster_eks.oidc
}

output "cluster_name" {
  value = module.cluster_eks.cluster_name
}

output "cluster_certificate_authority" {
  value = module.cluster_eks.cluster_certificate_authority
}