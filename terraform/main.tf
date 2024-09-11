resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}"
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}"
    }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}"
    }
  )
}

resource "aws_subnet" "database" {
  count = length(var.database_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}"
    }
  )
}