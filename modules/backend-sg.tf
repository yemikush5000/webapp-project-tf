resource "aws_security_group" "backend" {
  name        = "backend-sg"
  description = "Allow inbound traffic to backend services"
  vpc_id      = aws_vpc.default.id

  ingress {
    description      = "webapp to memcache"
    from_port        = local.mcf_port
    to_port          = local.mct_port
    protocol         = "tcp"
    security_groups  = var.ec2-sg
  }
  ingress {
    description      = "webapp to rabbitmq"
    from_port        = local.rmqf_port
    to_port          = local.rmqt_port
    protocol         = "tcp"
    security_groups  = var.ec2-sg
  }
 ingress {
    description      = "webapp to mysql"
    from_port        = "3306"
    to_port          = "3306"
    protocol         = "tcp"
    security_groups  = var.ec2-sg
  }
ingress {
    description      = "ssh to instance"
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

