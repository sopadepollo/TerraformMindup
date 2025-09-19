provider "aws" {
  region = "us-east-2"
}

module "network" {
  source = "./modules/network"
}

module "security" {
  source  = "./modules/security"
  vpc_id  = module.network.vpc_id
  subnets = module.network.subnets
}

module "database" {
  source     = "./modules/database"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.subnet_ids
  sg_id      = module.security.db_sg_id
}

module "compute" {
  source           = "./modules/compute"
  subnet_ids       = module.network.subnet_ids
  sg_id            = module.security.default_sg_id
  target_group_arn = module.others.target_group_arn
}

module "others" {
  source = "./modules/others"
  vpc_id = module.network.vpc_id
  sg_id  = module.security.default_sg_id
  subnets = module.network.subnets
}