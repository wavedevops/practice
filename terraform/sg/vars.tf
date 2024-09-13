variable "env" {}
variable "component" {}
variable "common_tags" {}
variable "vpc_tags" { default = {} }

variable "ingress_rules" {
  type = list
  default = [
#     {
#       from_port = 0
#       to_port = 0
#       protocol = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
  ]
}

variable "outbound_rules" {
  type = list
  default = [
    {
      from_port = 0
      to_port = 0
      protocol = "-1" # all protocols
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "sg_tags" { default = {} }
variable "sg_name" {}