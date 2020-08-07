resource "aws_alb" "webapp-alb" {
  name            = "webapp-load-balancer"
  subnets         = var.subnets
  security_groups = [aws_security_group.alb-sg.id]
}

resource "aws_alb_target_group" "webapp-tg" {
  name        = "webapp-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from ALB to Target Group

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.webapp-alb.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.webapp-tg.id
    type             = "forward"
  }
}
