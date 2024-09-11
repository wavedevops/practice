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
      Name = "${var.component}-${var.env}-public"
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
      Name = "${var.component}-${var.env}-private"
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
      Name = "${var.component}-${var.env}-database"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}-igw"
    }
  )
}

# resource "aws_eip" "eip" {
#   domain   = "vpc"
#   tags = merge(
#     var.common_tags,
#     var.vpc_tags,
#     {
#       Name = "${var.component}-${var.env}-eip"
#     }
#   )
# }
#
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.eip.id
#   subnet_id     = aws_subnet.public[0].id
#   tags = merge(
#     var.common_tags,
#     var.vpc_tags,
#     {
#       Name = "${var.component}-${var.env}-nat"
#     }
#   )
# }

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}-public"
    }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}-private"
    }
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.component}-${var.env}-database"
    }
  )
}

resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}