resource "aws_subnet" "public-subnets" {
  count = length(var.public-subnets-cidr)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public-subnets-cidr[count.index]
  availability_zone       = var.subnets-azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.pub-sub-name}-0${count.index + 1}"
  }
}