resource "aws_eks_cluster" "cluster_main" {
  name     = "${var.projectName}-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true

    subnet_ids = [
      var.public_subnet_1a,
      var.public_subnet_1b
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_role_attach]

  tags = merge(
    var.tags,
    {
      Name = "${var.projectName}-cluster"
    }
  )
}
