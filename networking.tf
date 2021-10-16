// VPC creation

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
    name = "vpc-tf${terraform.workspace}",
    env  = terraform.workspace
  }
}