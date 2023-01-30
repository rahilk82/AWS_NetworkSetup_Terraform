################################ VPC ###############################################

resource "aws_vpc" "custom_vpc_1" {
  cidr_block = var.custom_vpc_1
  tags = {
    Name = "custom_vpc_1"
  }
}

################################ Subnet #############################################

resource "aws_subnet" "custom_subnet_1" {
  vpc_id     = aws_vpc.custom_vpc_1.id
  cidr_block = var.custom_subnet_1
  map_public_ip_on_launch = true
  tags = {
    Name = "custom_subnet_1"
  }
}
resource "aws_subnet" "custom_subnet_2" {
  vpc_id     = aws_vpc.custom_vpc_1.id
  cidr_block = var.custom_subnet_2
  tags = {
    Name = "custom_subnet_2"
  }
}


################################# IGW ####################################################

resource "aws_internet_gateway" "custom_igw_1" {
  vpc_id = aws_vpc.custom_vpc_1.id

  tags = {
    Name = "custom_igw_1"
  }
}


resource "aws_internet_gateway_attachment" "igw_attachment_vpc" {
  internet_gateway_id = aws_internet_gateway.custom_igw_1.id
  vpc_id              = aws_vpc.custom_vpc_1.id

}


################################### Route Table #############################################

resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw_1.id
  }

  route {
    ipv6_cidr_block = "::/0"
  }
  tags = {
    Name = "custom_route_table"
  }
}

resource "aws_route_table_association" "custom_sub1_association" {
  subnet_id      = aws_subnet.custom_subnet_1.id
  route_table_id = aws_route_table.custom_route_table.id
}

resource "aws_route_table_association" "custom_sub2_association" {
  subnet_id      = aws_subnet.custom_subnet_2.id
  route_table_id = aws_route_table.custom_route_table.id
}

resource "aws_route" "custom_route" {
  route_table_id = aws_route_table.custom_route_table.id
  gateway_id = aws_internet_gateway.custom_igw_1.id
  destination_cidr_block = "0.0.0.0/0"
}