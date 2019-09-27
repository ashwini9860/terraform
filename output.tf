#output.tf

output "master_public_instance_ip" {
  value = ["${aws_instance.MasterInstance.*.public_ip}"]
}

 output "node_public_instance_ip" {
  value = ["${aws_instance.NodeInstance.*.public_ip}"]
}

output "helm_public_instance_ip" {
  value = ["${aws_instance.HelmInstance.*.public_ip}"]
}


