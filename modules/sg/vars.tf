variable "sg_name" {
  type = map(any)
  default = {
    "Name" = "allow_tls"
  }
}

variable "vpc_id" {
  type = string
}

