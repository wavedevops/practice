resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags =merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.project_name}-${var.environment}"
      Project     = "expense"
      Environment = "dev"
      Terraform   = "true"
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  availability_zone = var.azs[count.index]
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr[count.index]

  tags = {
    Name = "Main"
  }
}

###########