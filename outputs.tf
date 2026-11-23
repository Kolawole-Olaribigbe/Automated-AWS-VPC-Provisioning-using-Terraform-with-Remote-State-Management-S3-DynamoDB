
output "region_name" {
  description = "AWS region where the infrastructure is provisioned"
  value       = var.region_name
}

output "vpc_id" {
  description = "ID of the provisioned VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the provisioned public subnet"
  value       = aws_subnet.public_subnet.id
}
