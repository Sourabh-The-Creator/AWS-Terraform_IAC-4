variable "pvt_sub_cidr_block"{}
variable "pvt_sub_availability_zone"{}

resource "aws_subnet" "pvt_subnet" {
  
  vpc_id     = "${aws_vpc.my_vpc.id}"
  availability_zone = var.pvt_sub_availability_zone
  cidr_block = var.pvt_sub_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "private_subnet"
  }
}