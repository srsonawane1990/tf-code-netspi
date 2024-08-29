output "s3_bucket_id" {
  value = aws_s3_bucket.main.id
}

output "efs_volume_id" {
  value = aws_efs_file_system.main.id
}

output "ec2_instance_id" {
  value = aws_instance.main.id
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}
