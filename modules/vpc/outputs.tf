output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_id" {
  value = aws_subnet.single_subnet.id
}
output "security_group_id" {
  value = aws_security_group.test_expo.id
}