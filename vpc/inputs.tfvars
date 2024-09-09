project_name = "expense"
environment = "dev"

common_tags  = {
 Project     = "expense"
 Environment = "dev"
 Terraform   = "true"
}
azs = ["us-east-1a", "us-east-1b"]
public_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
# private_subnets_cidr = ["10.0.11.0/24", "10.0.12.0/24"]
vpc_cidr = "10.0.0.0/16"
environment = "dev"