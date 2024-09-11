variable "vpc_cidr" {}
variable "env" {}
variable "component" {}
variable "common_tags" {}
variable "vpc_tags" { default = {} }
variable "azs" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "database_subnets" {}