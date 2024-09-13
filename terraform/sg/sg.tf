resource "aws_security_group" "sg" {
  name        =   "${var.component}-${var.env}-sg"
  description = "${var.component}-${var.env}-sg"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

#   dynamic "" {
#     for_each = ""
#     content {}
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   ingress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#
  tags = merge(
    var.vpc_tags,
    var.common_tags,
    {
      Name = "${var.component}-${var.env}-sg"
    }
  )
}