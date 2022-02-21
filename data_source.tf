/*
  AWS Linux DataSource configuration
*/

// Datasource block used to fetch VPC ID
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

// Fetch Subnet ID using VPC and Subnet Name
data "aws_subnet" "subnet" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

// Instance Userdata Templates
data "template_file" "user_data" {
  template = file("${path.module}/cloud-init.sh")
  vars = {
    akv_local_user_aws_linux_vm = var.akv_local_user_aws_linux_vm
  }
}

// Fetch Security Group ID through Security Group Name
data "aws_security_group" "linux-sg" {
  name = var.security_group
}


// AWS Customer Account Name Alias
data "aws_iam_account_alias" "account_name" {}

