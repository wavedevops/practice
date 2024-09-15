resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project}/${var.env}/database"
  type  = "String"
  value = module.database.sg_id
}

resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project}/${var.env}/backend"
  type  = "String"
  value = module.backend.sg_id
}

resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project}/${var.env}/frontend"
  type  = "String"
  value = module.frontend.sg_id
}
