variable "rt_cidr_block"{}
variable "pvt_cidr_block"{}
resource "aws_route_table" "my_route_table" {

  vpc_id = "${aws_vpc.my_vpc.id}"

  route {

    cidr_block = var.rt_cidr_block
    gateway_id = "${aws_internet_gateway.my_gw.id}"

  }

  tags = {

    Name = "my_route_table"

  }

}

resource "aws_route_table" "pvt_route_table" {

  depends_on   = [aws_nat_gateway.NAT]
  vpc_id       = "${aws_vpc.my_vpc.id}"

  route {

    cidr_block = var.pvt_cidr_block
    gateway_id = "${aws_nat_gateway.NAT.id}"

  }

  tags = {
  
    Name       = "pvt_route_table"
  
  }
}




resource "aws_route_table_association" "rt_association" {

  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_route_table.id

} 




resource "aws_route_table_association" "pvt_rt_association" {

  subnet_id      = aws_subnet.pvt_subnet.id
  route_table_id = aws_route_table.pvt_route_table.id

}