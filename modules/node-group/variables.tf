

variable "subnet_ids" {
    type = set(string)
    description = "Subnets privadas"
}

variable "instance_types" {
    type = list(string)
    description = "Instance types EC2 of EKS"
}

variable "cluster_name" {
    type = string
    description = ""
}