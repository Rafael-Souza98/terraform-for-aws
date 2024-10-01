module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.project_name
    cidr = var.cidr_vpc

    enable_nat_gateway = false
    enable_vpn_gateway = false
    create_database_subnet_group = false
    create_elasticache_subnet_group = false
    create_flow_log_cloudwatch_iam_role = false
    create_redshift_subnet_group = false
    database_subnet_enable_dns64 = false
    
}

resource "aws_subnet" "public-subnet-1a" {
    vpc_id     = module.vpc.vpc_id
    cidr_block = cidrsubnet(var.cidr_vpc, 6, 1)
    availability_zone = "${data.aws_region.current.name}a"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "${var.project_name}-pub-subnet-1a"
        "kubernetes.io/role/elb" = 1
    }
}
resource "aws_subnet" "public-subnet-1b" {
    vpc_id     = module.vpc.vpc_id
    cidr_block = cidrsubnet(var.cidr_vpc, 6, 2)
    availability_zone = "${data.aws_region.current.name}b"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "${var.project_name}-pub-subnet-1b"
        "kubernetes.io/role/elb" = 1
    }
}

resource "aws_subnet" "private-subnet-1a" {
    vpc_id     = module.vpc.vpc_id
    cidr_block = cidrsubnet(var.cidr_vpc, 6, 3)
    availability_zone = "${data.aws_region.current.name}a"
    tags = {
        Name = "${var.project_name}-priv-subnet-1a"
        "kubernetes.io/role/internal-elb" = 1
    }
}

resource "aws_subnet" "private-subnet-1b" {
    vpc_id     = module.vpc.vpc_id
    cidr_block = cidrsubnet(var.cidr_vpc, 6, 4)
    availability_zone = "${data.aws_region.current.name}b"

    tags = {
        Name = "${var.project_name}-priv-subnet-1b"
        "kubernetes.io/role/internal-elb" = 1
    }
}

resource "aws_internet_gateway" "eks-igw" {
    vpc_id = module.vpc.vpc_id
    tags = {
        Name =  "${var.project_name}-igw"
    }
}
resource "aws_route_table" "eks-pub-rtb" {
    vpc_id = module.vpc.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eks-igw.id
    }
    tags = {
        Name =  "${var.project_name}-pub-rtb"
    }
}
resource "aws_route_table" "eks-priv-rtb" {
    vpc_id = module.vpc.vpc_id
    route {
        cidr_block = var.cidr_vpc
        gateway_id = "local"
    }
    tags = {
        Name =  "${var.project_name}-priv-rtb"
    }
}


resource "aws_route_table_association" "association-pub-rtb-1a" {
    subnet_id = aws_subnet.public-subnet-1a.id
    route_table_id = aws_route_table.eks-pub-rtb.id

}

resource "aws_route_table_association" "association-pub-rtb-1b" {
    subnet_id = aws_subnet.public-subnet-1b.id
    route_table_id = aws_route_table.eks-pub-rtb.id

}

resource "aws_route_table_association" "association-priv-rtb-1a" {
    subnet_id = aws_subnet.private-subnet-1a.id
    route_table_id = aws_route_table.eks-priv-rtb.id
}

resource "aws_route_table_association" "association-priv-rtb-1b" {
    subnet_id = aws_subnet.private-subnet-1b.id
    route_table_id = aws_route_table.eks-priv-rtb.id
}