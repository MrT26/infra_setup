output "dynamodb_table_arn" {
  value = module.dynamodb.dynamodb_table_arn
}
output "elastic_ip_id" {
  value = module.eip.elastic_ip_id
}
output "elastic_ip_public-ip" {
  value = module.eip.elastic_ip_public-ip
}
output "internet_gateway_id" {
  value = module.igw.internet_gateway_id
}
output "bastion_instance_public_ips" {
   value = module.instances.bastion_instance_public_ips
}
output "private_instance_private_ips" {
   value = module.instances.private_instance_private_ips
}
output "nat_gateway_id" {
  value = module.nat.nat_gateway_id
}
output "public_rt_id" {
   value = module.public-rt.public_rt_id
}
output "private_subnet_ids" {
   value = module.private-subnets.private_subnet_ids
}
output "private_rt_id" {
   value = module.private-rt.private_rt_id
}
output "public_subnet_ids" {
   value = module.public-subnets.public_subnet_ids
}
output "aws_s3_bucket_arn" {
  value = module.s3.aws_s3_bucket_arn
}
output "vpc_id" {
   value = module.vpc.vpc_id
}