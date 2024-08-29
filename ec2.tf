resource "aws_instance" "main" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with the desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  key_name      = "my-key" # Replace with your key pair name

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = 8
  }

  network_interface {
    network_interface_id = aws_network_interface.main.id
    device_index         = 0
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y amazon-efs-utils
              mkdir -p /data/test
              mount -t efs ${aws_efs_file_system.main.id}:/ /data/test
              EOF

  tags = {
    Name = "netspi-ec2"
  }
}

resource "aws_network_interface" "main" {
  subnet_id   = aws_subnet.main.id
  private_ips = ["10.0.1.10"]
  security_groups = [aws_security_group.main.id]
  associate_public_ip_address = true

  attachment {
    instance = aws_instance.main.id
    device_index = 0
  }
}

resource "aws_eip_association" "main" {
  instance_id   = aws_instance.main.id
  allocation_id = data.aws_eip.elastic_ip.id
}

