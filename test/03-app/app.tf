module "bastion" {
  source        = "../../terraform/03.app"
  component     = "bastion"
  env           = var.env
  ami           = data.aws_ami.ami.id
  common_tags   = var.common_tags
  instance_type = "t3.micro"
  security_groups = [data.aws_ssm_parameter.bastion_sg.value]
  subnet_id     = element(split(",",data.aws_ssm_parameter.public_subnet_id.value),0)
}
