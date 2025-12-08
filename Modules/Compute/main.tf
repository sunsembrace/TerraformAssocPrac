provider "aws" {
    region = var.region
}


data "aws_ami" "linux" {
    most_recent = true
    owners = ["amazon"]
}

resource "aws_instance" "instance" {
    ami = data.aws_ami.linux.id
    instance_type = var.instance_type

    tags = merge(
        var.common_tags,
        {name = var.instance_type_1}
    )
}

