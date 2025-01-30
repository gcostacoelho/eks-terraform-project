resource "aws_iam_role" "eks_role" {
  name = "${var.projectName}-eks-cluster-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.projectName}-eks-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_role_attach" {
  role       = aws_iam_role.eks_role.name
  policy_arn = var.eks_policy_arn
}