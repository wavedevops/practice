module "data-base" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "data-base"
}

module "backend" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "backend"
}

module "frontend" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "frontend"
}
