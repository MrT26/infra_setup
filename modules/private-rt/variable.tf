variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "private-rt-name" {
  type    = string
}
variable "destination-cidr" {
  type    = string
}
variable "nat-id" {
  description = "NAT Gateway ID"
  type        = string
}
variable "private_subnet_ids" {
  type    = list(string)
}