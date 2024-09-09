#### Project ####
variable "project_name"{}

variable "environment"{}

variable "common_tags" {}

#### vpc ####
variable "vpc_tags" {
  type = map
  default = {}
}
variable "vpc_cidr" {}
variable "azs" {}
variable "public_subnets_cidr" {}


#variable "project_name" {
#  default = "expense"
#}

#variable "common_tags" {
#  default = {
#    Project = "expense"
#    Environment = "dev"
#    Terraform = "true"
#  }
#}