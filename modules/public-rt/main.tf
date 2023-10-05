resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.public-rt-name
  }
}
resource "aws_route" "public-route" {
  route_table_id    = aws_route_table.public-rt.id
  destination_cidr_block = var.destination-cidr
  gateway_id        = var.igw-id
}
resource "aws_route_table_association" "public-subnet-association" {
  count        = length(var.public_subnet_ids)
  subnet_id    = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public-rt.id
}