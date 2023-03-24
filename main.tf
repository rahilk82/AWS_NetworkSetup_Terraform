module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_tag  = var.vpc_tag
}

module "subnet" {
  source      = "./modules/subnet"
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = var.subnet_cidr
  subnet_name = var.subnet_name
}

module "sg" {
  source  = "./modules/sg"
  sg_name = var.sg_name
  vpc_id  = module.vpc.vpc_id
}

module "nic" {
  source      = "./modules/nic"
  subnet_id   = module.subnet.subnet_id
  nic_name    = var.nic_name
  private_ips = var.private_ips
}

module "ec2" {
  source        = "./modules/ec2"
  instance_name = var.instance_name
  instance_ami  = var.instance_ami
  instance_type = var.instance_type
  nic_id        = module.nic.nic_id
}