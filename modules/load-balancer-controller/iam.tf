resource "aws_iam_role" "eks_controller_role" {
  name = "${var.projectName}-lb-role"

  assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Federated": "arn:aws:iam::${data.aws_caller_identity.identity.account_id}:oidc-provider/oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc_identity}"
                },
                "Action": "sts:AssumeRoleWithWebIdentity",
                "Condition": {
                    "StringEquals": {
                        "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc_identity}:aud": "sts.amazonaws.com",
                        "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc_identity}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
                    }
                }
            }
        ]
    }
EOF

  tags = merge(
    var.tags,
    {
      Name = "${var.projectName}-lb-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_role_attach" {
  role       = aws_iam_role.eks_controller_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn
}
