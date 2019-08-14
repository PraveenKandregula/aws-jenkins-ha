provider "aws" {
  region = "${var.aws_region}"
}

module "get_vpc" {
  source = "./modules/get_vpc"
}

module "create_security_group" {
  source = "./modules/create_security_group"

  vpc_id = "${module.get_vpc.vpc_id}"
}

module "create_ebs_volume" {
  source = "./modules/create_ebs_volume"

  az = "${var.az}"
  ebs_size = "${var.ebs_size}"
}
