resource "aws_lb_target_group" "webapp" {
  name     = "webapp-lb-tg"
  port     = local.to_port
  protocol = "TCP"
  vpc_id   = aws_vpc.default.id
}
