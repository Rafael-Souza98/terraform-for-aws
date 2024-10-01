module "cluster_eks" {
    source = "./modules/cluster-eks"
    project_name = var.project_name
    subnet_pub_1a = module.network.pub-subnet-1a
    subnet_pub_1b = module.network.pub-subnet-1b
    instance_types = var.instance_types
}

module "network" {
    source = "./modules/network"
    project_name = var.project_name
    cidr_vpc = var.cidr_vpc
    
}

module "manage_node_group" {
    source = "./modules/node-group"
    cluster_name = module.cluster_eks.cluster_name
    instance_types = var.instance_types
    subnet_ids = [ module.network.priv-subnet-1a, module.network.priv-subnet-1b ]
}