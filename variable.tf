variable "vpc-cidr" {
  description = "CIDR block for VPC"
  type = string
}
variable "instance-tenancy" {
  description = "Instance Tenancy value"
  type = string
}
variable "vpc-name" {
  description = "vpc name"
  type = string
}
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
variable "private-subnets-cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}
variable "pri-sub-name" {
  description = "Privat Subnet Name"
  type        = list(string)
}
variable "nat_name" {
  type    = string
}
variable "eip-domain" {
  description = "Elastic IP domain"  
  type = string
}
variable "igw_name" {
  type    = string
}
variable "private-rt-name" {
  type    = string
}
variable "destination-cidr" {
  type    = string
}
variable "public-rt-name" {
  type    = string
}
variable "ami-id" {
  description = "AMI ID for the instance"
  type        = string
}
variable "instance-type" {
  description = "Instance type"
  type        = string
}
variable "key-name" {
  description = "PEM Key Name"  
  type        = string
}
variable "bastion-instance-name" {
  description = "Bastion Instance Name"
  type        = string
}
variable "private-instance-name" {
  description = "Private Instance Name"
  type        = list(string)
}
variable "s3-bucket-name" {
  description = "S3 Bucket Name"  
  type = string
}
variable "aws-dynamodb-name" {
  description = "dynamo db Name"  
  type = string
}