//ssh to bastion from public world

resource "aws_security_group" "only_ssh_bostion" {

  depends_on=[aws_subnet.public_subnet]
  name        = "only_ssh_bostion"
  description = "Allow ssh bostion inbound traffic"
  vpc_id      =  aws_vpc.my_vpc.id



 ingress {
  
    description = "Only ssh_bastion in public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =  ["::/0"]
  
  }


 
 egress {
  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =  ["::/0"]
  
  }


  tags = {
 
    Name = "only_ssh_bostion"
 
  }
 
 }
