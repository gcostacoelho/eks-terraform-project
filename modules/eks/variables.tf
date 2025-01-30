variable "projectName" {
  type        = string
  description = "Variable to be used in aws resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added in AWS resources"
}

variable "eks_policy_arn" {
  type        = string
  description = "The ARN identity from the police"
}

variable "public_subnet_1a" {
  type        = string
  description = "Subnet to create a eks cluster AZ 1a"
}

variable "public_subnet_1b" {
  type        = string
  description = "Subnet to create a eks cluster AZ 1b"
}
