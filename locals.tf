/* 
locals variables used to add Variables in the local.
This local variable cannot paramaterized
Cannot be changed with "-var" while running terraform apply command 

workspace strings has been added we can create different env using workspace
# terraform workspace list // it will list the workspacess
# terraform workspace new <workspace-name / env-name> //it will create new workspace
# terraform workspace select <workspace-name>  // it will select / change the workspace
 */

locals {

  anyware                            = "0.0.0.0/0"
  cidr                               = "172.0.0.0/8"
  security-group-name                = "all-open-public-${terraform.workspace}"
  http                               = 80
  ssh                                = 22
  Kubernetes-API-server              = 6443
  etcd-server-clinet-api-from        = 2379
  etcd-server-client-api-to          = 2380
  kubelet-api-and-self               = 10250
  kube-scheduler                     = 10259
  kube-controller-manager            = 10257
  k8s-node-port-services-from = 30000
  k8s-node-port-services-to   = 32767
  k8s-dashboard = 8001


  // lodals for ec2
  ec2-node-name   = "ec2-k8s-node-${terraform.workspace}"
  ec2-master-name = "ec2-k8s-master-${terraform.workspace}"
  ec2-ssh-key     = "terraform"
}