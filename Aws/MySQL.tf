variable "MySQL_instance_type"{}
variable "MySQL_AMI"{}
variable "MySQL_availability_zone"{}
variable "MySQL_key_name"{}


resource "aws_instance" "mysql_instance" {

  ami                    = var.MySQL_AMI
  instance_type          = var.MySQL_instance_type
  availability_zone      = var.MySQL_availability_zone
  key_name               = var.MySQL_key_name
  subnet_id              = "${aws_subnet.pvt_subnet.id}"
  vpc_security_group_ids = [aws_security_group.mysql_sec_group.id ,aws_security_group.only_ssh_sql_bositon.id]
  
 
  tags = {
        Name = "mysql"
  }
}