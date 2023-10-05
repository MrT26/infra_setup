# VPC Configuration
vpc-cidr = "10.0.0.0/16"
instance-tenancy = "default"
vpc-name = "ninja-vpc-01"

# Public Subnet Configuration
public-subnets-cidr = ["10.0.0.0/24", "10.0.1.0/24"]
subnets-azs = ["ap-south-1a", "ap-south-1b"]
pub-sub-name = "pub-sub-01"

# Private Subnet Configuration
private-subnets-cidr = ["10.0.2.0/24", "10.0.3.0/24"]
pri-sub-name = ["priv-sub-01","priv-sub-02"]

# Other Configuration
nat_name = "ninja-nat-01"
eip-domain = "vpc"
igw_name = "ninja-igw-01"
private-rt-name = "ninja-route-priv-01"
destination-cidr = "0.0.0.0/0"
public-rt-name = "ninja-route-pub-01"
ami-id = "ami-0f5ee92e2d63afc18"
instance-type = "t2.micro"
key-name = "key_07"
bastion-instance-name = "bastion"
private-instance-name = ["private-instance-01","private-instance-02"]
s3-bucket-name = "terraform-assignment-5-state-bucket-01"
aws-dynamodb-name = "terraform-state-table"