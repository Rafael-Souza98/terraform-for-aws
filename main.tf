module "cluster_eks" {
  source         = "./modules/cluster-eks"
  project_name   = var.project_name
  subnet_pub_1a  = module.network.pub-subnet-1a
  subnet_pub_1b  = module.network.pub-subnet-1b
  instance_types = var.instance_types
  eks_version    = var.eks_version
}

module "network" {
  source                    = "./modules/network"
  project_name              = var.project_name
  cidr_vpc                  = var.cidr_vpc
  map_public_ip_subnet_priv = true
}

module "manage_node_group" {
  source         = "./modules/node-group"
  cluster_name   = module.cluster_eks.cluster_name
  instance_types = var.instance_types
  subnet_ids     = [module.network.priv-subnet-1a, module.network.priv-subnet-1b]
}

module "addons" {
  source       = "./modules/addons"
  project_name = var.project_name
  oidc         = module.cluster_eks.oidc
  cluster_name = module.cluster_eks.cluster_name
  vpc_id       = module.network.vpc_id
}


module "github-oidc" {
  source  = "terraform-module/github-oidc-provider/aws"
  version = "~> 1"

  create_oidc_provider      = var.create_oidc_provider
  create_oidc_role          = data.aws_iam_role.oidc_role.arn != null ? false : true
  role_name                 = var.role_oidc_name
  oidc_provider_arn         = "arn:aws:iam::826972386494:oidc-provider/token.actions.githubusercontent.com"
  repositories              = ["Rafael-Souza98/terraform-for-aws"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}