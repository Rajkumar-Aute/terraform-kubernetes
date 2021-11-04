// Variables for terraform filesresource
// Variables can be paramatirized.

// variable for Region, this can be changed while running terraform apply -var "region=<required_region>"
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Selected N-Virginia region"
}

// variable for instance type
variable "ec2-instance-type" {
  type        = string
  default     = "t2.medium"
  description = "ec2 instance type"
}
