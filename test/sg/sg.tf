module "database" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "database"
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

module "bastion" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "bastion"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
}

module "ansible" {
  source      = "../../terraform/sg"
  component   = var.component
  env         = var.env
  common_tags = var.common_tags
  sg_name     = "ansible"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
}


# ## db
# resource "aws_security_group_rule" "database" {
#   type              = "ingress"
#   from_port         = 3306
#   to_port           = 3306
#   protocol          = "tcp"
#   source_security_group_id = module.backend.sg_id  # allow all cidr's  from backend sg
#   security_group_id = module.database.sg_id
# }
# resource "aws_security_group_rule" "database_bastion" {
#   type              = "ingress"
#   from_port         = 3306
#   to_port           = 3306
#   protocol          = "tcp"
#   source_security_group_id = module.bastion.sg_id  # allow all cidr's  from backend sg
#   security_group_id = module.database.sg_id
# }
#
#
#
#
#
#
#
# resource "aws_security_group_rule" "backend" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   source_security_group_id = module.frontend.sg_id
#   security_group_id = module.backend.sg_id
# }
#
# resource "aws_security_group_rule" "backend_bastion" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   source_security_group_id = module.bastion.sg_id
#   security_group_id = module.backend.sg_id
# }
#
#
#
#
#
# resource "aws_security_group_rule" "frontend" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = module.frontend.sg_id
# }
#
# resource "aws_security_group_rule" "frontend_bastion" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   source_security_group_id = module.bastion.sg_id
#   security_group_id = module.frontend.sg_id
# }
#
# resource "aws_security_group_rule" "frontend_ansible" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   source_security_group_id = module.ansible.sg_id
#   security_group_id = module.frontend.sg_id
# }
#
#
#
#
#
# resource "aws_security_group_rule" "public_bastion" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = module.bastion.sg_id
# }
#
# resource "aws_security_group_rule" "ansible_public" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = module.ansible.sg_id
# }



######################


# DB is accepting connections from backend
resource "aws_security_group_rule" "db_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend.sg_id # source is where you are getting traffic from
  security_group_id = module.database.sg_id
}

resource "aws_security_group_rule" "db_bastion" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id # source is where you are getting traffic from
  security_group_id = module.database.sg_id
}

resource "aws_security_group_rule" "backend_frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend.sg_id # source is where you are getting traffic from
  security_group_id = module.backend.sg_id
}

resource "aws_security_group_rule" "backend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id # source is where you are getting traffic from
  security_group_id = module.backend.sg_id
}

resource "aws_security_group_rule" "backend_ansible" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.ansible.sg_id # source is where you are getting traffic from
  security_group_id = module.backend.sg_id
}

resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.frontend.sg_id
}

resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id # source is where you are getting traffic from
  security_group_id = module.frontend.sg_id
}

resource "aws_security_group_rule" "frontend_ansible" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.ansible.sg_id # source is where you are getting traffic from
  security_group_id = module.frontend.sg_id
}

resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}


resource "aws_security_group_rule" "ansible_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.ansible.sg_id
}

