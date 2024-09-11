module "vpc" {
  source = "../terraform"
  component = var.component
  env = var.env
  vpc_cidr = var.vpc_cidr
  common_tags = var.common_tags
  azs = var.azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  database_subnets = var.database_subnets
}