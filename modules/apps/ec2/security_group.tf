resource "aws_security_group" "allow_http" {
    name        = "allow_http_sg"
    description = "Security group for HTTP access"
    vpc_id      = var.vpc_id

    tags = {
        Name = "tutorial"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http.id

  cidr_ipv4   = var.cidr_block
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_http.id
#   cidr_ipv4   = "0.0.0.0/0" # Allow all outbound IPv4 traffic
#   from_port   = 0
#   ip_protocol = "-1" # "-1" allows all protocols
#   to_port     = 0
# }