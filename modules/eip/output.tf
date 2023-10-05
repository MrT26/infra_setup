output "elastic_ip_public-ip" {
  value = aws_eip.elastic-ip.public_ip
}
output "elastic_ip_id" {
   value = aws_eip.elastic-ip.id
}