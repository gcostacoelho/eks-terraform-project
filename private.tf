resource "aws_subnet" "eks_priv_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block_vpc, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.projectName}-priv-1a"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "eks_priv_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block_vpc, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.projectName}-priv-1b"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_route_table_association" "eks_priv_association_1a" {
  subnet_id      = aws_subnet.eks_priv_1a.id
  route_table_id = aws_route_table.eks_private_rtb_1a.id
}

resource "aws_route_table_association" "eks_priv_association_1b" {
  subnet_id      = aws_subnet.eks_priv_1b.id
  route_table_id = aws_route_table.eks_private_rtb_1b.id
}