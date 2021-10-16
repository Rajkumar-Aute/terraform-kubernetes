// creating web security group
resource "aws_security_group" "security-group" {
  name        = local.security-group-name
  description = "all port open to public"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    cidr_blocks = [local.anyware]
    description = "open ssh"
    from_port   = local.ssh
    protocol    = "tcp"
    to_port     = local.ssh
  }

  ingress {
    cidr_blocks = [local.anyware]
    description = "open http"
    from_port   = local.http
    protocol    = "tcp"
    to_port     = local.http
  }

  ingress {
    cidr_blocks = [local.cidr]
    description = "open all to cidr"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  egress {
    cidr_blocks = [local.anyware]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = {
    "Name" = local.security-group-name
    "env"  = terraform.workspace
  }
}