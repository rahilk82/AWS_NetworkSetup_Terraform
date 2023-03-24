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
  source = "./modules/nic"

  for_each = var.instance_config

  subnet_id   = module.subnet.subnet_id
  nic_name    = each.value.nic_name
  private_ips = each.value.private_ips
}

module "ec2" {
  source = "./modules/ec2"
  depends_on = [
    module.nic
  ]

  for_each = var.instance_config

  instance_name = each.value.instance_name
  instance_ami  = each.value.instance_ami
  instance_type = each.value.instance_type
  nic_id        = module.nic[each.key].nic_id
}