# network module output.tf
output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "public_subnet_id" {
  value = "${aws_subnet.subnet_public.id}"
}
output "demo_id" {
  value = ["${aws_security_group.demo.id}"]
}
