resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "Allow inbound traffic to alb"
  vpc_id      = aws_vpc.default.id

  ingress {
    description      = "inbound from Internet"
    from_port        = local.from_port
    to_port          = local.to_port
    protocol         = "tcp"
    cidr_blocks      = var.my-ip
  }

 ingress {
    description      = "inbound ssh connection"
    from_port        = "22"
    to_port          = "22"
    protocol         = "tcp"
    cidr_blocks      = var.my-ipg
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
