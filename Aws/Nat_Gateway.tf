resource "aws_eip" "EIP" {
  vpc              = true
  public_ipv4_pool = "amazon"
}
output "new_output" {
  value=  aws_eip.EIP
}
resource "aws_nat_gateway" "NAT" {
  depends_on=[aws_eip.EIP]
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.public_subnet.id
tags = {
    Name = "NAT_Gateway"
  }
}
