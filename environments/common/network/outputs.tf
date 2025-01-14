output "vpc" {
  value = {
    id         = aws_vpc.main.id
    cidr_block = aws_vpc.main.cidr_block
  }
}

output "subnets" {
  value = module.subnets
}