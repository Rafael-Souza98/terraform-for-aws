output "pub-subnet-1a" {
  value       = aws_subnet.public-subnet-1a.id
  description = "ID da subnet publica 1a"
}

output "pub-subnet-1b" {
  value       = aws_subnet.public-subnet-1b.id
  description = "ID da subnet publica 1b"
}

output "priv-subnet-1a" {
  value       = aws_subnet.private-subnet-1a.id
  description = "ID da subnet privada 1a"
}

output "priv-subnet-1b" {
  value       = aws_subnet.private-subnet-1b.id
  description = "ID da subnet privada 1b"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID da VPC"
}