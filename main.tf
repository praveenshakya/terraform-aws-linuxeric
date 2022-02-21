/*
  AWS Linux Module to provision Instance
*/

provider "aws" {
  region = "eu-west-1"
}

// EC2 Instance Configuration
resource "aws_instance" "ec2" {
  ami                    = "ami-0b0af3577fe5e3532"
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.subnet.id
  vpc_security_group_ids = [data.aws_security_group.linux-sg.id]
  user_data              = data.template_file.user_data.rendered
  iam_instance_profile   = var.iam_role

  // Tags of EC2 Instance
  tags = {
    environment       = var.environment
    hostname          = var.hostname
    Name              = var.hostname
    operatingsystem   = var.operatingsystem
    startstopschedule = var.startstopschedule
    serverrole        = var.serverrole
    applicationname   = var.applicationname
    applicationowner  = var.applicationowner
    criticality       = var.criticality
    backup            = var.backup
  }

  // EC2 Root Volume Configuration
  root_block_device {
    volume_size           = var.root_vol_size
    volume_type           = var.root_vol_type
    delete_on_termination = var.root_vol_deletion
  }

  // Ignore Userdata and Tags Updates on Running Instances
  lifecycle {
    ignore_changes = [tags, user_data]
  }
}

// Instance Secondary GP2 volumes Configuration
resource "aws_ebs_volume" "gp2_volume" {
  count             = length(var.sec_gp2_size)
  availability_zone = data.aws_subnet.subnet.availability_zone
  size              = element(var.sec_gp2_size, count.index)
  type              = var.sec_gp2_type
}

// Attach Secondary GP2 volumes
resource "aws_volume_attachment" "gp2_vol_attach" {
  count        = length(var.sec_gp2_size)
  device_name  = "/dev/${var.sec_gp2_name[count.index]}"
  volume_id    = aws_ebs_volume.gp2_volume[count.index].id
  instance_id  = aws_instance.ec2.id
  force_detach = "true"
}

