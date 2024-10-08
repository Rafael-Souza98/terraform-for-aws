provider "aws" {
  region = var.region
  default_tags {
    tags = var.tags
  }
}

provider "kubernetes" {
  host                   = module.cluster_eks.endpoint
  cluster_ca_certificate = base64decode(module.cluster_eks.cluster_certificate_authority)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.cluster_eks.cluster_name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.cluster_eks.endpoint
    cluster_ca_certificate = base64decode(module.cluster_eks.cluster_certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.cluster_eks.cluster_name]
      command     = "aws"
    }
  }
}