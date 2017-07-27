provider "scaleway" {
  region = "par1"
}

module "security_group" {
  source = "./modules/security_group"
}

module "kubectl-master" {
  source = "./modules/kubectl-master"
}

module "kubectl-minion" {
  source = "./modules/kubectl-minion"
}

