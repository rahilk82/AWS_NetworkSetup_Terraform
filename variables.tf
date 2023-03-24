variable "vpc_cidr" {
  type        = string
  description = ""
  default     = "172.16.0.0/16"
}

variable "vpc_tag" {
  type = map(any)
  default = {
    "Name" = "rahil-vpc-custom"
  }
}

variable "subnet_cidr" {
  type    = string
  default = "172.16.10.0/24"
}

variable "subnet_name" {
  type = map(any)
  default = {
    "Name" = "rahil-subnet"
  }
}

variable "sg_name" {
  type = map(any)
  default = {
    "Name" = "allow_tls"
  }
}

variable "nic_name" {
  type = map(any)
  default = {
    "Name" = "my_nic"
  }
}

variable "private_ips" {
  type    = string
  default = "172.16.10.100"
}

variable "instance_ami" {
  type    = string
  default = "ami-06d94a781b544c133"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_name" {
  type = map(any)
  default = {
    "Name" = "Prod-Server-Rahil"
  }
}

variable "instance_config" {
  type = map(any)
}