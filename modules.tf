module "eks_network_module" {
  source         = "./modules/network"
  cidr_block_vpc = var.cidr_block_vpc
  projectName    = var.projectName
  tags           = local.tags
}