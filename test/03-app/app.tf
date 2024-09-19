module "bastion" {
  source        = "../../terraform/03.app"
  component     = "bastion"
  env           = var.env
  ami           = data.aws_ami.ami.id
  common_tags   = var.common_tags
  instance_type = "t3.micro"
  security_groups = [data.aws_ssm_parameter.bastion_sg.value]
  subnet_id     = element(split(",",data.aws_ssm_parameter.public_subnet_id.value),0)
  user_data     = file("expense.sh")
}

# module "frontend" {
#   source        = "../../terraform/03.app"
#   component     = "frontend"
#   env           = var.env
#   ami           = data.aws_ami.ami.id
#   common_tags   = var.common_tags
#   instance_type = "t3.micro"
#   security_groups = [data.aws_ssm_parameter.frontend_sg.value]
#   subnet_id     = element(split(",",data.aws_ssm_parameter.private_subnet_id.value),0)
#   user_data     = ""
# }
#
# module "backend" {
#   source        = "../../terraform/03.app"
#   component     = "backend"
#   env           = var.env
#   ami           = data.aws_ami.ami.id
#   common_tags   = var.common_tags
#   instance_type = "t3.micro"
#   security_groups = [data.aws_ssm_parameter.backend_sg.value]
#   subnet_id     = element(split(",",data.aws_ssm_parameter.private_subnet_id.value),0)
#   user_data     = ""
# }

# module "bastion" {
#   source = "../../terraform/05.dns"
#   zone_id = data.cloudflare_zone.zone.id
#   component = "bastion"
#   dns_record = module.bastion.public_ip
#   record_type = "A"
# }
#
# module "frontend" {
#   source = "../../terraform/05.dns"
#   zone_id = data.cloudflare_zone.zone.id
#   component = "frontend"
#   dns_record = module.frontend.private_ip
#   record_type = "A"
# }
#
# module "backend" {
#   source = "../../terraform/05.dns"
#   zone_id = data.cloudflare_zone.zone.id
#   component = "backend"
#   dns_record = module.backend.private_ip
#   record_type = "A"
# }
#
# module "web" {
#   source = "../../terraform/05.dns"
#   zone_id = data.cloudflare_zone.zone.id
#   component = ""
#   dns_record = module.frontend.public_ip
#   record_type = "A"
# }



























# data "aws_ssm_parameter" "token" {
#   name = "api_token"
# }
#
# data "cloudflare_zone" "zone" {
#   name = "chowdary.cloud"
# }
#
# resource "cloudflare_record" "app" {
#   zone_id = data.cloudflare_zone.zone.id
#   name    = "bastion"
#   value   = module.bastion.public_ip
#   type    = "A"
#   ttl     = 1
#   proxied = false
# }