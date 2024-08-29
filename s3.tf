resource "aws_s3_bucket" "main" {
  bucket = "netspi-bucket"
  acl    = "private"
  tags = {
    Name = "netspi-s3"
  }
}

