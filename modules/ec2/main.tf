resource "aws_instance" "foo" {
  instance_type = var.instance_type
  ami = var.instance_ami

  network_interface {
    device_index         = 0
    network_interface_id = var.nic_id
  }

  tags = var.instance_name
}