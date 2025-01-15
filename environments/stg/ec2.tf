module "ec2" {
    source = "../../modules/apps/ec2"
    subnet_id = module.network.public_subnet_id
    vpc_security_group_ids = module.network.security_group_ids
    tags = {
        Name = "tutorial_web_server"
    }
  
}