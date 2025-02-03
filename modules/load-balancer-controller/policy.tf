resource "aws_iam_policy" "eks_controller_policy" {
  name   = "${var.projectName}-lb-controller-policy"
  policy = file("${path.module}/iam_policy.json")

  tags = merge(
    var.tags,
    {
      Name = "${var.projectName}-lb-policy"
    }
  )
}
