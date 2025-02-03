output "cluster_name" {
  value = aws_eks_cluster.cluster_main.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster_main.endpoint
}

output "cluster_ca_cert" {
  value = aws_eks_cluster.cluster_main.certificate_authority[0].data
}

output "oidc" {
  value = aws_eks_cluster.cluster_main.identity[0].oidc[0].issuer
}