resource "aws_security_group" "webapp" {
  name        = "webapp-sg"
  description = "Allow inbound traffic to webapp"
  vpc_id      = aws_vpc.default.id

  ingress {
    description      = "inbound from alb"
    from_port        = local.from_port
    to_port          = local.to_port
    protocol         = "tcp"
    security_groups  = var.lb-sg
  }
 ingress {
    description      = "inbound ssh connection"
    from_port        = "22"
    to_port          = "22"
    protocol         = "tcp"
    cidr_blocks      = var.my-ip
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "alb-sg"
  }
}

