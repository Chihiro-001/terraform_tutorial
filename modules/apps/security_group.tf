resource "aws_security_group" "ec2_sg" {
    name        = "http_sg"
    description = "Security group for HTTP access"
    vpc_id      = var.vpc_id

    ingress {
        description = "Allow HTTP inbound traffic"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.allowed_ip]
    }

    egress {
        description = "Allow HTTP outbound traffic"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.allowed_ip]
    }

    tags = {
        Name = "tutorial_ec2_sg"
    }
}
