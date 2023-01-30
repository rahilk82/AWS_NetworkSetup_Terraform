output "custom_vpc_ip" {
  value = aws_vpc.custom_vpc_1.cidr_block
}

output "custom_subnet_1" {
  value = aws_subnet.custom_subnet_1.cidr_block
}

output "custom_subnet_2" {
  value = aws_subnet.custom_subnet_2.cidr_block
}

