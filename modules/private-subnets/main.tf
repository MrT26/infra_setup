resource "aws_subnet" "private-subnets" {
  count = length(var.private-subnets-cidr)
  vpc_id                  = var.vpc_id
  cidr_block              = var.private-subnets-cidr[count.index]
  availability_zone       = var.subnets-azs[count.index]

  tags = {
    Name = "${var.pri-sub-name[count.index]}-0${count.index + 1}"
  }
}