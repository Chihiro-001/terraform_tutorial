resource "aws_subnet" "public" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnets.public.cidr_block
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "tutorial-public-subnet"
  }
}