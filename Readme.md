The Terraform and Script files are used to build Kubernetes Master and Nodes,
add your aws credentials to user/.aws/credentials file with profile name terraform
and create terraform ssh key.
clone the repository to local folder and run the terraform script,

after build login into master instance "cat /user/ubuntu/kubeclustertocken" you will get kubernetes token for joining nodes to the master. 

run the token commend in node it will be added to the cluster.