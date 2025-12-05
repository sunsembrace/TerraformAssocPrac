#VPC
variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type = string
}

variable "enable_dns_hostnames" {
    description = "Enable DNS hostname for VPC"
    type = string
}

variable "enable_dns_support" {
    description = "Enable DNS support for VPC"
    type = string
}

variable "vpc_name" {
    default = ""
    type = string
}
variable "common_tags" {
    default = ""
    type = string
}

#subnets
variable "public_sn1_name" {
    default = ""
    type = string
}

variable "private_sn1_name" {
    default = ""
    type = string
}