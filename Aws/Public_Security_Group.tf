resource "aws_security_group" "wp_sec_group" {
  name        = "wp_sec_group"
  vpc_id      = "${aws_vpc.my_vpc.id}"

  ingress {

    description = "allow_http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  
  }


  ingress {
  
    description = "allow_SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  
  }

  ingress {
   
    description = "allow_icmp"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks  = ["::/0"]

  }

  egress {
   
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  
  }


  tags = {

    Name = "wp_sec_group"

  }

}