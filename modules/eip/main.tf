resource "aws_eip" "elastic-ip" {
  domain   = var.eip-domain
}