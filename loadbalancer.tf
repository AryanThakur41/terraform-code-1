resource "aws_lb" "my_alb" {
  name               = "load-balancer-terraform"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-0cc91120d0e8d7de8","subnet-0e23c8c4c868e0853"]
  security_groups    = ["sg-0bf16957c5cb9d445"] 
}
resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-03918e0276383675c"

  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}
resource "aws_lb_target_group_attachment" "my_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.terraform_server.id
  port             = 80
}