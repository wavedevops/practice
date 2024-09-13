resource "aws_security_group" "sg" {
  name        = "${var.component}-${var.env}-${var.sg_name}"
  description = "SG for ${var.sg_name} Instances"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.outbound_rules
    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }
  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
      Name = "${var.component}-${var.env}-${var.sg_name}"
    }
  )
}