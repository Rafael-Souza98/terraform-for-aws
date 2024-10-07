variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "cidr_vpc" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR da VPC"
}

variable "instance_types" {
  type        = list(string)
  description = "Instance types EC2 of EKS"
}


variable "teste" {
  type        = list(string)
  description = "teste"
}

