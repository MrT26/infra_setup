resource "aws_vpc" "main" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = var.instance-tenancy
  tags = {
    Name = var.vpc-name
  }
}