module "data-base" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "data-base"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
}

module "backend" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "backend"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
}

module "frontend" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "frontend"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
}
