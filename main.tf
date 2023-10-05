module "vpc" {
  source = "./modules/vpc"
  vpc-cidr    = var.vpc-cidr
  instance-tenancy = var.instance-tenancy
  vpc-name = var.vpc-name
}
 module "public-subnets" {
  source = "./modules/public-subnets"
  vpc_id = module.vpc.vpc_id
  public-subnets-cidr = var.public-subnets-cidr
  subnets-azs = var.subnets-azs
  pub-sub-name = var.pub-sub-name
 }
 module "private-subnets" {
  source = "./modules/private-subnets"
  vpc_id = module.vpc.vpc_id
  private-subnets-cidr = var.private-subnets-cidr
  subnets-azs = var.subnets-azs
  pri-sub-name = var.pri-sub-name
 }
 module "eip" {
  source = "./modules/eip"
  eip-domain = var.eip-domain
 }
 module "nat" {
  source = "./modules/nat"
  elastic_ip_id = module.eip.elastic_ip_id
  public_subnet_id = element(module.public-subnets.public_subnet_ids, 0)
  nat_name = var.nat_name
 }
  module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  igw_name = var.igw_name
 }
  module "private-rt" {
  source = "./modules/private-rt"
  vpc_id = module.vpc.vpc_id
  private-rt-name = var.private-rt-name
  destination-cidr = var.destination-cidr
  nat-id = module.nat.nat_gateway_id
  private_subnet_ids = module.private-subnets.private_subnet_ids
 }
 module "public-rt" {
  source = "./modules/public-rt"
  vpc_id = module.vpc.vpc_id
  public-rt-name = var.public-rt-name
  destination-cidr = var.destination-cidr
  igw-id = module.igw.internet_gateway_id
  public_subnet_ids = module.public-subnets.public_subnet_ids
 }
 module "instances" {
  source = "./modules/instances"
  ami-id = var.ami-id
  instance-type = var.instance-type
  public_subnet_ids = module.public-subnets.public_subnet_ids
  key-name = var.key-name
  bastion-instance-name = var.bastion-instance-name
  private_subnet_ids = module.private-subnets.private_subnet_ids
  private-instance-name = var.private-instance-name
 }
module "s3" {
  source = "./modules/s3"
  s3-bucket-name = var.s3-bucket-name
 }
 module "dynamodb" {
  source = "./modules/dynamodb"
  aws-dynamodb-name = var.aws-dynamodb-name
 }