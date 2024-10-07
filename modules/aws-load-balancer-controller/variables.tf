variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "oidc" {
  type = string
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}