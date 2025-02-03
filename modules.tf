module "eks_network_module" {
  source         = "./modules/network"
  cidr_block_vpc = var.cidr_block_vpc
  projectName    = var.projectName
  tags           = local.tags
}

module "eks_cluster" {
  source           = "./modules/eks"
  projectName      = var.projectName
  public_subnet_1a = module.eks_network_module.subnet_pub_1a
  public_subnet_1b = module.eks_network_module.subnet_pub_1b
  tags             = local.tags
}

module "eks_managed_node_group" {
  source       = "./modules/managed-node-group"
  projectName  = var.projectName
  cluster_name = module.eks_cluster.cluster_name
  subnet_priv_ids = tolist([
    module.eks_network_module.subnet_priv_1a,
    module.eks_network_module.subnet_priv_1b,
  ])
  tags = local.tags
}

module "eks_load_balancer" {
  source      = "./modules/load-balancer-controller"
  projectName = var.projectName
  tags        = local.tags
}