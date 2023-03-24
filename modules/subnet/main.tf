resource "aws_subnet" "my_subnet_1" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr

  tags = var.subnet_name
}