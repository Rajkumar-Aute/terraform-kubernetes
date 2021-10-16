// information output about below resources
output "vpcid" {
  value = aws_default_vpc.default.id
}

output "server-master-1-id" {
  value = aws_instance.ec2-kube-master.id
}

output "server-master-1-ip" {
  value = aws_instance.ec2-kube-master.public_ip
}

output "server-master-1-name" {
  value = aws_instance.ec2-kube-master.tags_all
}

output "server-node-id" {
  value = aws_instance.ec2-kube-node.id
}

output "server-node-ip" {
  value = aws_instance.ec2-kube-node.public_ip
}

output "server-node-name" {
  value = aws_instance.ec2-kube-node.tags_all
}