resource "kubernetes_service_account" "example" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazon.aws/role-arn" = aws_iam_role.eks_controller_role.arn
    }
  }
}
