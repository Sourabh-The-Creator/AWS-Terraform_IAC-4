// allow-bostion host to ssh into mysql

resource "aws_security_group" "only_ssh_sql_bositon" {
  
  depends_on=[aws_subnet.public_subnet]
  
  name          = "only_ssh_sql_bostion"
  description   = "Allow ssh bostion inbound traffic"
  vpc_id        =  aws_vpc.my_vpc.id



 ingress {
   
    description = "Only ssh_sql_bostion in public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups=[aws_security_group.only_ssh_bostion.id]
 
 }



 
 egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =  ["::/0"]

  }


  tags = {
    Name = "only_ssh_sql_bostion"
  }
}
