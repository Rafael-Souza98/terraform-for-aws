variable "project_name" {
    type = string
    description = "Nome do projeto"
}

variable "cidr_vpc" {
    type = string
    default = "10.0.0.0/16"
    description = "CIDR da VPC"
}

variable "subnet_pub_1a" {
    type = string
    description = "Public subnet 1a"
}

variable "subnet_pub_1b" {
    type = string
    description = "Public subnet 1b"
}

variable "instance_types" {
    type = list(string)
    description = "Instance types EC2 of EKS"
}