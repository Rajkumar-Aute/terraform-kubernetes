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

  ingress {
    cidr_blocks = [local.anyware]
    description = "Kubernetes-API-server"
    from_port   = local.Kubernetes-API-server
    protocol    = "tcp"
    to_port     = local.Kubernetes-API-server
  }

  ingress {
    cidr_blocks = [local.anyware]
    description = "etcd-server-clinet-api"
    from_port   = local.etcd-server-clinet-api-from
    protocol    = "tcp"
    to_port     = local.etcd-server-client-api-to
  }

  ingress {
    cidr_blocks = [local.anyware]
    description = "kubelet-api-and-self"
    from_port   = local.kubelet-api-and-self
    protocol    = "tcp"
    to_port     = local.kubelet-api-and-self
  }

  ingress {
    cidr_blocks = [local.anyware]
    description = "kube-scheduler"
    from_port   = local.kube-scheduler
    protocol    = "tcp"
    to_port     = local.kube-scheduler
  }

  ingress {
    cidr_blocks = [local.anyware]
    description = "kube-controller-manager"
    from_port   = local.kube-controller-manager
    protocol    = "tcp"
    to_port     = local.kube-controller-manager
  }

  ingress {
    cidr_blocks = [local.anyware]
    description = "Kubernetes-node-port-services"
    from_port   = local.Kubernetes-node-port-services-from
    protocol    = "tcp"
    to_port     = local.Kubernetes-node-port-services-to
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