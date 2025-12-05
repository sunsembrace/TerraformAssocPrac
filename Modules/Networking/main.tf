#VPC #Still WIP
resource "aws_vpc" "main"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support

    tags = merge(
        var.common_tags,
        {name = var.vpc_name}
    )
}

#subnets
resource "aws_subnet" "public_sn" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.vpc_cidr

    tags = merge(
        var.common_tags,
        {name = var.public_sn1_name}
    )
}

resource "aws_subnet" "private_sn" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.vpc_cidr

    tags = merge(
        var.common_tags,
        {name = var.private_sn1_name}
    )
}

#IGW
resource "aws_igw" "igw"{
    vpc_id = aws_vpc.main.id

    tags = merge(
        var.common_tags,
        {name = var.igw_name}
    )
    }
