locals {
  enabled = var.enabled ? 1 : 0
  rule_description = coalesce(var.description, "Lambda warmer for ${var.function_name}")
}

resource "aws_cloudwatch_event_rule" "lambda_warmer_cw_event_rule" {
  count               = local.enabled
  name                = "${var.function_name}-lambda-warmer-cw-event"
  description         = local.rule_description
  schedule_expression = "rate(${var.warmer_rate} minutes)"
  tags                = var.tags
}

resource "aws_cloudwatch_event_target" "lambda_warmer_event_target" {
  count     = local.enabled
  rule      = aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule[0].name
  arn       = data.aws_lambda_function.lambda_function.arn
  target_id = "${var.function_name}-warmer"
  input     = var.target_input
}

resource "aws_lambda_permission" "lambda_warmer_invoke_permissions" {
  count         = local.enabled
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.lambda_function.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule[0].arn
}