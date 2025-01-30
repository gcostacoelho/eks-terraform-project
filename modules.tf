module "eks_network_module" {
  source         = "./modules/network"
  cidr_block_vpc = var.cidr_block_vpc
  projectName    = var.projectName
  tags           = local.tags
}

module "eks_cluster" {
  source           = "./modules/eks"
  projectName      = var.projectName
  eks_policy_arn   = var.eks_policy_arn
  public_subnet_1a = module.eks_network_module.subnet_pub_1a
  public_subnet_1b = module.eks_network_module.subnet_pub_1b
  tags             = local.tags
}
