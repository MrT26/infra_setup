resource "aws_instance" "bastion" {
  count = length(var.public_subnet_ids)

  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id     = var.public_subnet_ids[count.index]
  key_name      = var.key-name

  tags = {
    Name = "${var.bastion-instance-name}-0${count.index + 1}"
  }
}
resource "aws_instance" "private_instance" {
  count = length(var.private_subnet_ids)

  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id     = var.private_subnet_ids[count.index]
  key_name      = var.key-name

  tags = {
    Name = "${var.private-instance-name[count.index]}-0${count.index + 1}"
  }
}