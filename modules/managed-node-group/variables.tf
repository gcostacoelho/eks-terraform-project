variable "projectName" {
  type        = string
  description = "Variable to be used in aws resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added in AWS resources"
}

variable "cluster_name" {
  type        = string
  description = "CLuster name to be  used in EKS Node Group"
}

variable "subnet_priv_ids" {
  type        = set(string)
  description = "The list of subnets identities to be used in EKS Node Group"
}