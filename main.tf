#main.tf global
terraform {
  backend "s3" {
    # Be sure to change this bucket name and region to match an S3 Bucket you have already created!
    bucket = "testawsashu"
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}


#providers
provider "aws" {
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region = "${var.region}"
}

data "template_file" "myuserdata" {
  template = "${file("global/files/user_data.sh")}"
}

#module
module "networkModule" {
  source = "./module/network"
}



#module "ec2Module" {
#  source = "./module/ec2"
#}

#resources
#resource "aws_key_pair" "ec2key" {
#  key_name = "publicKey"
#  public_key = "${file(var.public_key_path)}"
#}

#resource "aws_instance" "MasterInstance" {
#  count         = "${var.master_instance_count}"
#  ami           = "${var.centos_instance_ami}"
#  instance_type = "${var.master_instance_type}"
#  subnet_id = "${module.networkModule.public_subnet_id}"
#  user_data = "${data.template_file.myuserdata.template}" 
#  vpc_security_group_ids = "${module.networkModule.demo_id}"
#  key_name = "${var.instance_key}"
#  root_block_device {
#    delete_on_termination = true
#    volume_size = "${var.master_root_volume_size}"
#  }
#  tags = {
#  Name = "Centos-Master"	
#	}

#  provisioner "remote-exec" {
#    inline = ["echo 'ready'"]
#
#    connection {
#      host        = "${self.public_ip}"
#      type        = "ssh"
#      user        = "terraform"
#      private_key = "${file(var.ssh_key_private)}"
#    }
#  }

#  provisioner "local-exec" {
#    command = "ansible-playbook -u terraform -i '${self.public_ip},' --private-key ${var.ssh_key_private} provision.yml"
#
#  }
#}

#resource "aws_instance" "NodeInstance" {
#  count         = "${var.node_instance_count}"
#  ami           = "${var.centos_instance_ami}"
#  instance_type = "${var.node_instance_type}"
#  subnet_id = "${module.networkModule.public_subnet_id}"
#  user_data = "${data.template_file.myuserdata.template}"
#  vpc_security_group_ids = "${module.networkModule.demo_id}"
#  key_name = "${var.instance_key}"
#  root_block_device {
#    delete_on_termination = true
#    volume_size = "${var.node_root_volume_size}"
#  }
#  tags = {
#  Name = "Centos-Node"
#        }
#
#  provisioner "remote-exec" {
#    inline = ["echo 'ready'"]
#
#    connection {
#      host        = "${self.public_ip}"
#      type        = "ssh"
#      user        = "terraform"
#      private_key = "${file(var.ssh_key_private)}"
#    }
#  }
#
#  provisioner "local-exec" {
#    command = "ansible-playbook -u terraform -i '${self.public_ip},' --private-key ${var.ssh_key_private} provision.yml"
#
#  }
#}

#resource "aws_instance" "HelmInstance" {
#  count         = "${var.helm_instance_count}"
#  ami           = "${var.centos_instance_ami}"
#  instance_type = "${var.helm_instance_type}"
#  subnet_id = "${module.networkModule.public_subnet_id}"
#  user_data = "${data.template_file.myuserdata.template}"
#  vpc_security_group_ids = "${module.networkModule.demo_id}"
#  key_name = "${var.instance_key}"
#  root_block_device {
#    delete_on_termination = true
#    volume_size = "${var.helm_root_volume_size}"
#  }
#  tags = {
#  Name = "Centos-Helm"
#        }
#}


