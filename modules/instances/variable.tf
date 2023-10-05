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

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public Subnet IDs"
  type        = list(string)
}

variable "bastion-instance-name" {
  description = "Bastion Instance Name"
  type        = string
}

variable "private-instance-name" {
  description = "Private Instance Name"
  type        = list(string)
}