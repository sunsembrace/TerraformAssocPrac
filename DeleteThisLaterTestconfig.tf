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