output "pub-subnet-1a" {
  value = aws_subnet.public-subnet-1a.id
}

output "pub-subnet-1b" {
  value = aws_subnet.public-subnet-1b.id
}

output "priv-subnet-1a" {
  value = aws_subnet.private-subnet-1a.id
}

output "priv-subnet-1b" {
  value = aws_subnet.private-subnet-1b.id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}