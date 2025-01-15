module "network" {
    source = "../common/network"
    public_subnet_id = module.network.public_subnet_id
}