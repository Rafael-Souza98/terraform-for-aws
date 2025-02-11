output "endpoint" {
  value       = module.cluster_eks.endpoint
  description = "Endpoint do cluster EKS"
}
output "cluster_certificate_authority" {
  value       = module.cluster_eks.cluster_certificate_authority
  description = "Certificado do cluster EKS"
}

output "oidc" {
  value       = module.cluster_eks.oidc
  description = "OIDC do cluster"
}

output "cluster_name" {
  value       = module.cluster_eks.cluster_name
  description = "Nome do cluster EKS"
}