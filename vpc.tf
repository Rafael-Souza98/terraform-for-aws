resource "aws_vpc" "eks_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "eks-vpc"
    }
}

resource "aws_subnet" "main" {
    vpc_id     = aws_vpc.eks_vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "Main"
    }
}