data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners      = ["973714476881"]
}


data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project}/${var.env}/public_subnet_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.project}/${var.env}/private_subnet_id"
}

data "aws_ssm_parameter" "bastion_sg" {
  name  = "/${var.project}/${var.env}/bastion_sg_id"
}


data "aws_ssm_parameter" "ansible_sg" {
  name  = "/${var.project}/${var.env}/ansible_sg_id"
}

data "aws_ssm_parameter" "frontend_sg" {
  name  = "/${var.project}/${var.env}/frontend_sg_id"
}

data "aws_ssm_parameter" "backend_sg" {
  name  = "/${var.project}/${var.env}/backend_sg_id"
}


data "aws_ssm_parameter" "token" {
  name = "api_token"
}

data "cloudflare_zone" "zone" {
  name = "chowdary.cloud"
}