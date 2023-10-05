variable "public-subnets-cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}
variable "subnets-azs" {
  description = "Availability zones for subnets"
  type        = list(string)
}
variable "pub-sub-name" {
  description = "Public Subnet Name"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}