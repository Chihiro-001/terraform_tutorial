variable "public_subnet_id" {
  description = "The ID of the public subnet"

}

variable "vpc_id" {
    description = "The VPC ID where the security group will be created"
    
}

variable "cidr_block" {
  description = "value of the VPC cidr block"
}