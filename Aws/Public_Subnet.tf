variable "public_subnet_cidr_block"{}
variable "pub_sub_availability_zone"{}

resource "aws_subnet" "public_subnet" {

  vpc_id     = "${aws_vpc.my_vpc.id}"
  availability_zone = var.pub_sub_availability_zone
  cidr_block = var.public_subnet_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  
  }

}

