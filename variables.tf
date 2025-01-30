# Global Variables
variable "projectName" {
  type        = string
  description = "Variable to be used in aws resources (Name tag)"
}

# VPC Variables
variable "cidr_block_vpc" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}($|/(16|24))$", var.cidr_block_vpc))
    error_message = "This format is not valid"
  }
}