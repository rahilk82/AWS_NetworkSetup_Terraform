variable "instance_ami" {
  type = string
  default = "ami-06d94a781b544c133"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "nic_id" {
  type = string
}

variable "instance_name" {
  type = map(any)
  default = {
    "Name" = "Prod-Server-Rahil"
  }
}