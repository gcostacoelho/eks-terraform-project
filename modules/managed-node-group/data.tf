data "aws_iam_policy" "worker_node_policy" {
  name = "AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "ec2_container_register" {
  name = "AmazonEC2ContainerRegistryPullOnly"
}

data "aws_iam_policy" "eks_cni_policy" {
  name = "AmazonEKS_CNI_Policy"
}