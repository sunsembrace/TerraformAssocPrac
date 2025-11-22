#default config
provider "aws" {
    region = "us-central1"
}

#alternate config, whose alias is europe
provider "aws" {
    alias = "europe"
    region = "eu-west1"
}

resource "aws_compute_instance" "aliasinstance" {
    provider = aws.europe 
}

locals {
ingress_rules = [{
    port = 443
    description = "Port 443"
},
{
    port = 80
    description = "port 80"
}]

}
resource "aws_security_group" "main" {
    name = "sg"
    vpc_id= data.aws_vpc.main.id

    dynamic "ingress" {
        for_each = local.ingress_rules

        content {
            description = ingress.value.description
            from_port = ingress.value.port
            to_port = ingrress.value.port
            protocol = "tcp"
            cidr_blocks = {"0.0.0.0/0"}
        }
    }
}