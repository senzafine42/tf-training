output "instance_id" {
  value       = aws_instance.this.id
  description = "EC2 instance ID."
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address."
}

output "security_group_id" {
  value       = aws_security_group.this.id
  description = "Security group ID."
}
