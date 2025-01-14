module "route_table" {
  source        = "./modules/route_tables"
  vpc_id        = aws_vpc.main.id
  subnet_public_id = module.subnets.subnet_public_id
  igw_id        = aws_internet_gateway.main.id
}