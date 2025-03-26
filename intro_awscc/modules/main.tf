# AWSCC
resource "awscc_ec2_security_group_egress" "example" {
  group_id    = aws_security_group.allow_all.id
  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
  cidr_ip     = "0.0.0.0/0"
  description = "Created by AWSCC Provider"
  lifecycle {
    prevent_destroy = true
  }
}

# ---

# AWS Provider

resource "aws_vpc" "selected" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "selected-vpc"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all outbound traffic"
  vpc_id      = aws_vpc.selected.id

  tags = {
    Name = "hands_on"
  }
}

resource "aws_security_group_rule" "example" {
  type              = "egress"
  security_group_id = aws_security_group.allow_all.id
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Created by AWS Provider"

}

