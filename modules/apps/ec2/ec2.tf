resource "aws_instance" "web" {
    ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
    instance_type = "t2.micro"
    # Public Subnet assign to instance
    subnet_id     = var.public_subnet_id

    # Security group assign to instance
    vpc_security_group_ids= [aws_security_group.allow_http.id]

    user_data = <<-EOF
                            #!/bin/bash
                            sudo yum update -y
                            sudo yum install -y httpd
                            sudo systemctl start httpd
                            sudo systemctl enable httpd
                            echo "<html><body><h1>Hello, World</h1></body></html>" > /var/www/html/index.html
                            EOF

    tags = {
        Name = "tutorial_web_server"
    }
}