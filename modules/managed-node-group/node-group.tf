resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.projectName}-node-group"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids      = var.subnet_priv_ids[*]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.mng_role_attach_worker,
    aws_iam_role_policy_attachment.mng_role_attach_cni,
    aws_iam_role_policy_attachment.mng_role_attach_container,
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.projectName}-eks-mng"
    }
  )
}
