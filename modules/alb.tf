resource "aws_lb" "webapp" {
  name               = var.lb-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb-sg
  subnets            = [for subnet in aws_subnet.public : subnet.id]
  tags = {
    Environment = "production"
  }
}
