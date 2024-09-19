resource "aws_instance" "app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet_id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.component}-${var.env}"
    }
  )
}



