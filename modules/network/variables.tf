variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "cidr_vpc" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR da VPC"
}

variable "map_public_ip_subnet_priv" {
  type        = bool
  description = "Mapeia IP publico na subnet privada caso não queira utilizar NAT para fins de teste e redução de custo"
  default     = false
}

