# This is an temporary module.
# This will schedule the aws task to run on cron job.
# We want to move to Dagster but for the moment its useful to have this setup

resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = "nwp-schedule-${var.environment}"
  schedule_expression = "cron(0 8,14,20 * * ? *)"
  # runs every day 8.00, 14.00 and 20.00, will have to update this for production
}

resource "aws_cloudwatch_event_target" "ecs_scheduled_task" {

  rule      = aws_cloudwatch_event_rule.event_rule.name
  target_id = "nwp-schedule-${var.environment}"
  arn       = var.ecs-cluster.arn
  role_arn  = aws_iam_role.cloudwatch_role.arn

  ecs_target {

    launch_type         = "FARGATE"
    platform_version    = "1.4.0"
    task_count          = 1
    task_definition_arn = aws_ecs_task_definition.nwp-task-definition.arn
    network_configuration {

      subnets          = var.public_subnet_ids
      assign_public_ip = true

    }

  }

}
