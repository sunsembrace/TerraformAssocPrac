output "vpc_id" {
    description = ""
    value = aws_vpc.main.id
}

output "subnet_ids" {
    description = "list of subnets"
    value = [
        aws_subnet.public_sn1.id,
        aws_subnet.private_sn1.id
    ]
}