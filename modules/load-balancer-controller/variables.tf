variable "projectName" {
  type        = string
  description = "Variable to be used in aws resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added in AWS resources"
}