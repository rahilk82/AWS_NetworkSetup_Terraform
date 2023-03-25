resource "aws_vpc" "main" {
  for_each   = var.vpc_cidr
  cidr_block = each.value.cidr
  instance_tenancy = each.value.instance_tenancy

  tags = each.value["tags"]
}