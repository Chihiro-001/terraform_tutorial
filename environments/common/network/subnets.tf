module "subnets" {
  source = "./modules/subnets"
  vpc_id = aws_vpc.main.id
  subnets = {
    public = {
      cidr_block = var.subnet_cidr
    }
  }
}