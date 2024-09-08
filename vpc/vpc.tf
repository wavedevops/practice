module "VPC" {
  source = "../terraform"
  azs    = var.azs
  environment = var.environment
  project_name = var.project_name
  public_subnets_cidr = var.public_subnets_cidr
  vpc_cidr = var.vpc_cidr
}