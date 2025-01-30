resource "aws_iam_role" "eks_mng_role" {
  name = "${var.projectName}-mng-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.projectName}-mng_role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "mng_role_attach_worker" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = data.aws_iam_policy.worker_node_policy.arn

  depends_on = [data.aws_iam_policy.worker_node_policy]
}

resource "aws_iam_role_policy_attachment" "mng_role_attach_container" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = data.aws_iam_policy.ec2_container_register.arn

  depends_on = [data.aws_iam_policy.ec2_container_register]

}

resource "aws_iam_role_policy_attachment" "mng_role_attach_cni" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = data.aws_iam_policy.eks_cni_policy.arn

  depends_on = [data.aws_iam_policy.eks_cni_policy]
}
