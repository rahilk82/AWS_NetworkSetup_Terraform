vpc_cidr = "172.16.0.0/16"

vpc_tag = {
  Name = "prod-vpc"
}

subnet_cidr = "172.16.10.0/24"

subnet_name = {
  "Name" = "prod_subnet"
}

sg_name = {
  "Name" = "prod_tls"
}

nic_name = {
  "Name" = "prod_nic"
}

#INSTANCE

private_ips = "172.16.10.100"

instance_name = {
  "Name" = "prod-server"
}

instance_ami = "ami-00169914e6299b8e0"

instance_type = "t2.micro"