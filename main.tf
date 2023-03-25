resource "aws_vpc" "main" {
  for_each   = var.vpc_cidr
  cidr_block = each.value

  tags = {
    "Name" = each.key
  }
}