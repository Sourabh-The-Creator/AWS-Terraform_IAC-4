variable "WP_AMI"{}
variable "WP_instance_type"{}
variable "WP_availability_zone"{}
variable "WP_key_name"{}

resource "aws_instance" "wp_instance" {
  
  ami               = var.WP_AMI
  instance_type     = var.WP_instance_type
  availability_zone = var.WP_availability_zone
  key_name          = var.WP_key_name
  subnet_id         = "${aws_subnet.public_subnet.id}"
  security_groups   = [ "${aws_security_group.wp_sec_group.id}" ]
 
 
  tags = {
        Name = "WordPress"
  }
}