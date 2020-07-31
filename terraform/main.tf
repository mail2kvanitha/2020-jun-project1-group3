# This will have all the code that utilize the modules.
module "vpc" {
  source    = "./modules/vpc"
  CIDRBlock = var.CIDRBlock
}