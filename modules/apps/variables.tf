variable "public_subnet_id" {
  description = "The ID of the public subnet"

}

variable "vpc_security_group_ids" {
  description = "The IDs of the security groups"
  
}


variable "vpc_id" {
    description = "The VPC ID where the security group will be created"
    
}

variable "allowed_ip" {
    description = "The IP address allowed to access the security group"
    
}