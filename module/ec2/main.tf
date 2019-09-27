#resource "aws_key_pair" "ec2key" {
#  key_name = "publicKey"
#  public_key = "${file(var.public_key_path)}"
#}

data "template_file" "myuserdata" {
  template = "${file("global/files/user_data.sh")}"
}

#module
module "networkModule" {
  source = "./module/network"
}

resource "aws_instance" "MasterInstance" {
  count         = "${var.master_instance_count}"
  ami           = "${var.centos_instance_ami}"
  instance_type = "${var.master_instance_type}"
  subnet_id = "${module.networkModule.public_subnet_id}"
  user_data = "${data.template_file.myuserdata.template}"
  vpc_security_group_ids = "${module.networkModule.demo_id}"
  key_name = "${var.instance_key}"
  root_block_device {
    delete_on_termination = true
    volume_size = "${var.master_root_volume_size}"
  }
  tags = {
  Name = "Centos-Master"
        }

}

