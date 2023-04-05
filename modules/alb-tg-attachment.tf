resource "aws_lb_target_group_attachment" "webapp" {
  target_group_arn = aws_lb_target_group.webapp.arn
  target_id        = aws_instance.webapp.id
  port             = 8080
}
