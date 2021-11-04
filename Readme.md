## The Terraform and Script files are used to build Kubernetes Master and Nodes,
* Add your **_ aws credentials to user/.aws/credentials _** file with profile name terraform
and create terraform ssh key in the AWS console.

* create new folder and clone the repository to local folder and run the terraform script,
```
git clone https://github.com/RajkumarAute/terraform-kubernetes.git
cd terraform-kubernetes
terraform init
terraform apply
```
* revise the creation statement then approve for apply process.

### after build
* after build login into master instance "cat /user/ubuntu/kubeclustertocken" you will get kubernetes token for joining nodes to the master. 

* run the token commend in node it will be added to the cluster.



* note -  for testing purpose allowed all ports publicly 
