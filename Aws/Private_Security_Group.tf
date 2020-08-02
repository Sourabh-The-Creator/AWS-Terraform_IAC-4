resource "aws_security_group" "mysql_sec_group" {
 
  depends_on=[aws_subnet.public_subnet]
  name        = "mysql_sec"
  description = "Allow only sql web inbound traffic"
  vpc_id      =  aws_vpc.my_vpc.id



 ingress {

    description = "Only web  sql from public subnet"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups=[aws_security_group.wp_sec_group.id]
    
  }


  ingress {

    description = "Only web ping sql from public subnet"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    security_groups=[aws_security_group.wp_sec_group.id]
    ipv6_cidr_blocks=["::/0"]
    
  
  }




  egress {
    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks =  ["::/0"]
  
  }


  tags = {
  
    Name = "only_sql_web"
  
  }
}


