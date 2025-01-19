module "ec2" {
  source           = "../../modules/apps/ec2"
  public_subnet_id = data.terraform_remote_state.network.outputs.subnets.subnet_public_id
  cidr_block       = data.terraform_remote_state.network.outputs.vpc.cidr_block
  vpc_id           = module.network.vpc.id
}
