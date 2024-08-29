resource "aws_efs_file_system" "main" {
  creation_token = "netspi-efs"
  tags = {
    Name = "netspi-efs"
  }
}

resource "aws_efs_mount_target" "main" {
  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = aws_subnet.main.id
  security_groups = [aws_security_group.main.id]
}

