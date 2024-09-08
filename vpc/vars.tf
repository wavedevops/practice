#project_name = "expense"
#azs = ["us-east-1a", "us-east-1b"]
#
#public_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
#
##private_subnets_cidr = ["10.0.11.0/24", "10.0.12.0/24"]
#vpc_cidr = "10.0.0.0/16"
#environment = "dev"

variable "project_name" {
  default = "expense"
}
variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "environment" {
  default = "dev"
}