
resource "aws_vpc" "vpc" {
  cidr_block = "10.2.0.0/16"
  tags = var.tags
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.2.1.0/24"
  availability_zone = "${var.region}a"
  tags = var.tags
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.2.2.0/24"
  availability_zone = "${var.region}b"
  tags = var.tags
}

resource "aws_route_table" "route_public_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  tags = var.tags
}

resource "aws_route_table" "route_private_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  tags = var.tags
}

resource "aws_route_table_association" "route_association_public" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.route_public_subnet_1.id
}

resource "aws_route_table_association" "route_association_private" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.route_private_subnet_1.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = var.tags
}