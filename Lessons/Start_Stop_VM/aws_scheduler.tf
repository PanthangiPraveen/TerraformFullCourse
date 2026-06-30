resource "aws_iam_role" "scheduler_role" {
  name = "dev-scheduler-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "://amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "scheduler_policy" {
  role = aws_iam_role.scheduler_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["ec2:StartInstances", "ec2:StopInstances"]
      Resource = "*"
    }]
  })
}

# Friday 8:00 PM Stop
resource "aws_scheduler_schedule" "stop_dev" {
  name       = "stop-dev-instances"
  group_name = "default"

  flexible_time_window { mode = "OFF" }
  schedule_expression          = "cron(0 20 ? * FRI *)"
  schedule_expression_timezone = "America/New_York"

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:stopInstances"
    role_arn = aws_iam_role.scheduler_role.arn
    input    = jsonencode({ InstanceIds = [aws_instance.dev_vm.id] })
  }
}

# Monday 10:00 AM Start
resource "aws_scheduler_schedule" "start_dev" {
  name       = "start-dev-instances"
  group_name = "default"

  flexible_time_window { mode = "OFF" }
  schedule_expression          = "cron(0 10 ? * MON *)"
  schedule_expression_timezone = "America/New_York"

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:startInstances"
    role_arn = aws_iam_role.scheduler_role.arn
    input    = jsonencode({ InstanceIds = [aws_instance.dev_vm.id] })
  }
}
