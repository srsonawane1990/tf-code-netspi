data "aws_eip" "elastic_ip" {
  filter {
    name   = "tag:Project"
    values = ["NetSPI_EIP"]
  }
}

