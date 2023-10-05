variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "public-rt-name" {
  type    = string
}
variable "destination-cidr" {
  type    = string
}
variable "igw-id" {
  description = "Internet Gateway ID"
  type        = string
}
variable "public_subnet_ids" {
  type    = list(string)
}