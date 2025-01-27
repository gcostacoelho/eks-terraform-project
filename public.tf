resource "aws_subnet" "eks-pub-1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block_vpc, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.projectName}-pub-1a"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "eks-pub-1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block_vpc, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.projectName}-pub-1b"
      "kubernetes.io/role/elb" = 1
    }
  )
}


resource "aws_route_table_association" "eks-pub-association-1a" {
  subnet_id      = aws_subnet.eks-pub-1a.id
  route_table_id = aws_route_table.eks-public-rtb.id
}

resource "aws_route_table_association" "eks-pub-association-1b" {
  subnet_id      = aws_subnet.eks-pub-1b.id
  route_table_id = aws_route_table.eks-public-rtb.id
}