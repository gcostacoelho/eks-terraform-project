variable "projectName" {
  type        = string
  description = "Variable to be used in aws resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added in AWS resources"
}

variable "oidc_url" {
  type        = string
  description = "URL OIDC provider to be used in IAM Role"
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "vpc_id" {
  type        = string
  description = "VPC Identity"
}