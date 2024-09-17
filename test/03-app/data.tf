data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners      = ["973714476881"]
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project}/${var.env}/public_subnet_id"
}


data "aws_ssm_parameter" "bastion_sg" {
  name  = "/${var.project}/${var.env}/bastion_sg_id"
}
