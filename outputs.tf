output "bucket_name" {
  value = module.s3_private_bucket.bucket_name
}

output "bucket_arn" {
  value = module.s3_private_bucket.bucket_arn
}

output "ec2_instance_id" {
  value = module.ec2_basic.instance_id
}

output "ec2_private_ip" {
  value = module.ec2_basic.private_ip
}

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet_id" {
  value = aws_subnet.default_vpc_subnet.id
}

output "ssh_security_group_id" {
  value = aws_security_group.ssh.id
}
