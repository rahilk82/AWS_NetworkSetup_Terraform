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

instance_config = {

  instance_1 = {
    nic_name = {"Name" = "dev_nic1"}
    private_ips = ["172.16.20.100"]
    instance_name = {"Name" = "dev-SERVER1"}
    instance_ami = "ami-00169914e6299b8e0"
    instance_type = "t2.micro"
  }

  instance_2 = {
    nic_name = {"Name" = "dev_nic2"}
    private_ips = ["172.16.20.101"]
    instance_name = {"Name" = "dev-SERVER2"}
    instance_ami = "ami-00169914e6299b8e0"
    instance_type = "t2.micro"
  }
}