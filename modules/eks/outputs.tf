output "cluster_name" {
  value = aws_eks_cluster.cluster_main.id
}

output "oidc" {
  value = aws_eks_cluster.cluster_main.identity[0].oidc[0].issuer
}