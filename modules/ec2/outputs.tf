output "vpc_id" {
  value = module.vpc.vpc_id
}

output "frontend_ip" {
  value = aws_instance.frontend.public_ip
}
output "backend_ip" {
  value = aws_instance.backend.public_ip
}
output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}