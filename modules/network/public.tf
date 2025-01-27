resource "aws_subnet" "eks_pub_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block_vpc, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                     = "${var.projectName}-pub-1a"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "eks_pub_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block_vpc, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                     = "${var.projectName}-pub-1b"
      "kubernetes.io/role/elb" = 1
    }
  )
}


resource "aws_route_table_association" "eks_pub_association_1a" {
  subnet_id      = aws_subnet.eks_pub_1a.id
  route_table_id = aws_route_table.eks_public_rtb.id
}

resource "aws_route_table_association" "eks_pub_association_1b" {
  subnet_id      = aws_subnet.eks_pub_1b.id
  route_table_id = aws_route_table.eks_public_rtb.id
}