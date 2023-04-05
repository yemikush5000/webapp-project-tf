resource "aws_lb_listener" "webapp" {
  load_balancer_arn = aws_lb.webapp.arn
  port              = local.port
  protocol          = local.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp.arn
  }
}
