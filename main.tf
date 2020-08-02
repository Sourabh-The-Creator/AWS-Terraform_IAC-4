provider "aws" {
	region = "ap-south-1"
	profile = "myprofile"
}

module "aws" {

    source = "./Aws"
    cidr_block= "192.168.0.0/16"

    pub_sub_availability_zone = "ap-south-1a"
    public_subnet_cidr_block= "192.168.1.0/24"  

    pvt_sub_cidr_block = "192.168.2.0/24"
    pvt_sub_availability_zone = "ap-south-1a"  

    rt_cidr_block = "0.0.0.0/0"
    pvt_cidr_block = "0.0.0.0/0"
    
    Bastion_ami = "ami-0732b62d310b80e97"
    Bastion_instance_type = "t2.micro"
    Bastion_availability_zone= "ap-south-1a"
    Bastion_key_name = "key1"

    WP_AMI = "ami-0e9c43b5bc2603d9d"
    WP_instance_type = "t2.micro"
    WP_availability_zone= "ap-south-1a"
    WP_key_name = "key1"

    MySQL_AMI = "ami-0eb6467b60a881234"
    MySQL_instance_type = "t2.micro"
    MySQL_availability_zone= "ap-south-1a"
    MySQL_key_name = "key1"
    
    
}



