variable "Bastion_ami"{}
variable "Bastion_availability_zone"{}
variable "Bastion_instance_type"{}
variable "Bastion_key_name"{}


resource "aws_instance" "bostion_host" {

  depends_on             = [aws_security_group.only_ssh_bostion]
  ami                    = var.Bastion_ami
  instance_type          = var.Bastion_instance_type
  availability_zone      = var.Bastion_availability_zone
  subnet_id              = "${aws_subnet.public_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.only_ssh_bostion.id}"]
  key_name               = var.Bastion_key_name

  tags = {

    Name = "bostion_host"
  
  }
}