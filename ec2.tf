// creation of ec2 instances
resource "aws_instance" "ec2-kube-master" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = var.ec2-instance-type
  key_name                    = local.ec2-ssh-key
  vpc_security_group_ids      = [aws_security_group.security-group.id]

  depends_on = [
    aws_security_group.security-group
  ]

  tags = {
    "Name" = local.ec2-master-name
    "env"  = terraform.workspace
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/rajsa/sshkey.pem") // provide the ssh key path by creating from AWS Console
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./scriptmaster.sh"
    destination = "/home/ubuntu/.script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu",
      "sh .script.sh",
    ]
  }
}

resource "aws_instance" "ec2-kube-node" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = var.ec2-instance-type
  key_name                    = local.ec2-ssh-key
  vpc_security_group_ids      = [aws_security_group.security-group.id]

  tags = {
    "Name" = local.ec2-node-name
    "env"  = terraform.workspace
  }

  depends_on = [
    aws_instance.ec2-kube-master,
    aws_security_group.security-group
  ]
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/rajsa/sshkey.pem") // provide the ssh key path by creating from AWS Console
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./scriptnode.sh"
    destination = "/home/ubuntu/.script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu",
      "sh .script.sh",
    ]
  }
}