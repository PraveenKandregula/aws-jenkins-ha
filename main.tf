provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "bucket-tfstate"
    key = "aws/terraform/jenkins"
  }
}

module "get_vpc" {
  source = "./modules/get_vpc"
}

#module "create_s3_bucket" {
  #source = "./modules/create_s3_bucket"
#}

module "create_security_group" {
  source = "./modules/create_security_group"

  vpc_id = "${module.get_vpc.vpc_id}"
}

module "create_ebs_volume" {
  source = "./modules/create_ebs_volume"

  az = "${var.az}"
  ebs_size = "${var.ebs_size}"
}

#module "get_subnet_id" {
  #source = "./modules/get_subnet_id"

  #vpc_id = "${module.get_vpc.vpc_id}"
  #az = "${var.az}"
#}

module "create_ec2_instance" {
  source = "./modules/create_ec2_instance"

  az = "${var.az}"
  ami_id = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  security_groups = "${module.create_security_group.jenkins_security_group_id}"
  associate_public_ip_address = "true"
  #subnet_id = "${module.get_subnet_id.jenkins-aws-subnet-id}"
  subnet_id = "${var.subnet_id}"
  key_name = "${var.key_name}"
  volume_id = "${module.create_ebs_volume.ebs_volume_id}"
}

