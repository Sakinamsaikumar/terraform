provider "aws" {
  region = "us-east-1"
}

# -------- VPC MODULE ----------
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az                  = var.az
}

# -------- EC2 MODULE ----------
module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  key_name      = var.key_name
  az            = var.az
}

# -------- RDS MODULE ----------
module "rds" {
  source     = "./modules/rds"
  db_user    = var.db_user
  db_pass    = var.db_pass
  subnet_ids = [module.vpc.private_subnet_id]
  sg_id      = var.sg_id
}
