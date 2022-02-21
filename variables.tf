/*
  AWS Linux Module Variables
*/

// Instance Variables
variable "account_id" {
  description = "AWS Account ID to provision VM"
  default     = ""
}

variable "region" {
  description = "AWS Region to provision VM"
  default     = ""
}

variable "vpc_name" {
  description = "VPC Name to provision VM"
  default     = ""
}

variable "subnet_name" {
  description = "Subnet Name to provision VM"
  default     = ""
}

variable "security_group" {
  description = "Security Group to attach"
  default     = ""
}

variable "ami_owner" {
  description = "ID of AMI owner to use for the instance"
  default     = "430170170793"
}

variable "operatingsystem" {
  description = "Operating System of VM"
  default     = ""
}

variable "instance_type" {
  description = "Type of instance to start"
  default     = ""
}

variable "hostname" {
  description = "Hostname of the VM"
  default     = ""
}

variable "key_name_os" {
  description = "Key Name to use for the instance"
  default     = ""
}

variable "kms_alias" {
  description = "KMS Alias to encrypt the instance disk"
  default     = "alias/aws/ebs"
}

variable "akv_local_user_aws_linux_vm" {
  description = "Local Linux User Password"
  default     = ""
}

variable "iam_role" {
  description = "IAM Role to assign to the VM"
  default     = "AmazonEC2RoleforSSM"
}

// Root Volume Variables
variable "encryption" {
  description = "If true, the EC2 instance Disk will be encrypted"
  default     = "true"
}

variable "root_vol_size" {
  description = "Root Volume Size of Instance"
  default     = ""
}

variable "root_vol_type" {
  description = "Root Volume Type of Instance"
  default     = "gp2"
}

variable "root_vol_deletion" {
  description = "If true, the EC2 instance Root Volume will delete on termination"
  default     = "true"
}

// Secondary Volume Variables
variable "sec_gp2_size" {
  description = "GP2 Disk Size of Instance"
  default     = ""
}

variable "sec_gp2_type" {
  description = "Secondary GP2 Disk Type"
  default     = "gp2"
}

variable "sec_gp2_name" {
  description = "Array of Secondary GP2 Disk Name"
  default     = ["xvde", "xvdf", "xvdg", "xvdh", "xvdi", "xvdj", "xvdk", "xvdl", "xvdm", "xvdn"]
}

variable "sec_iops_size" {
  description = "Array of Secondary IOPS Disk Size"
  default     = ""
}

variable "sec_iops_type" {
  description = "Array of Secondary IOPS Disk Type"
  default     = ""
}

variable "sec_iops_value" {
  description = "Array of Secondary IOPS Disk Value"
  default     = ""
}

variable "sec_iops_name" {
  description = "Array of Secondary IOPS Disk Names"
  default     = ["xvdo", "xvdp", "xvdq", "xvdr", "xvds", "xvdt", "xvdu", "xvdv", "xvdw", "xvdx"]
}

// Instance Tag Variables
variable "environment" {
  description = "Environment Tag"
  default     = ""
}

variable "startstopschedule" {
  description = "Instance Start-Stop Schedule"
  default     = ""
}

variable "serverrole" {
  description = "Instance Server Role"
  default     = ""
}

variable "criticality" {
  description = "Instance Server Criticality"
  default     = ""
}

variable "applicationname" {
  description = "Instance Application Name"
  default     = ""
}

variable "applicationowner" {
  description = "Instance Application Owner"
  default     = ""
}

variable "backup" {
  description = "If true, the EC2 instance backup will be enabled"
  default     = ""
}
