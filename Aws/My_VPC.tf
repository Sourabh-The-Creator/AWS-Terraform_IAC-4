variable "cidr_block"{}

resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "my_vpc"
  }
}