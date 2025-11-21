
#Practice instance
resource "aws_instance" "server" {
    count = 4

    ami = var.ami
    instance_type = var.instance_type

    tags = {
        Name = "Server ${count.index}"
    }
}

#Practice instance per subnet
resource "aws_instance" "serverY" {
    count = length(var.subnet_ids)
}