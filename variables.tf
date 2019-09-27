#variables.tf

#variable "access_key" {
#	default = ""
#}
#variable "secret_key" {
#	default = ""
#}
variable "region" {
  default = "ap-south-1"
}
variable "instance_key" {
  description = "aws key for ssh into instance"
  default = "ashwini-mumbai"
}
variable "master_instance_count" {
  default = "1"
}
variable "node_instance_count" {
  default = "1"
}
variable "helm_instance_count" {
  default = "1"
}
variable "ubuntu_instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-03dcedc81ea3e7e27"
}
variable "centos_instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-02e60be79e78fef21"
}
variable "master_instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.medium"
}
variable "node_instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "helm_instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "enviironiment_tag" {
  description = "Environment tag"
  default = "Demo"
}
variable "ssh_key_private" {
  default     = "/root/.ssh/id_rsa_terraform"
  description = "Path to the SSH private key"
}
variable "master_root_volume_size" {
  default     = "12"
  description = "root device volume master"
}
variable "node_root_volume_size" {
  default     = "15"
  description = "root device volume node"
}
variable "helm_root_volume_size" {
  default     = "8"
  description = "root device volume node"
}






