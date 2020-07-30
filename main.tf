module "vpc" {
  source       = "./infra/vpc"
    CIDRBlock      = var.CIDRBlock
}
