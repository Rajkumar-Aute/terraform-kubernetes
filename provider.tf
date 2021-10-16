// Cloud Provider information
provider "aws" {
  region                  = var.region
  shared_credentials_file = "/Users/$user/.aws/credentials"
  profile                 = "terraform"
}

# It will help us to get Account ID and User details.
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}