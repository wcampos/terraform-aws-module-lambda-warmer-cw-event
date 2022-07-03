resource "aws_cloudwatch_event_rule" "lambda_warmer_cw_event_rule" {
  name                = "${var.function_name}-lambda-warmer-cw-event"
  description         = "lambda warmer for ${var.function_name}"
  schedule_expression = rate(var.warmer_rate)
}

resource "aws_cloudwatch_event_target" "lambda_warmer_event_target" {
  rule = aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule.name
  arn  = data.aws_lambda_function.lambda_function.arn
}

resource "aws_lambda_permission" "lambda_warmer_invoke_permissions" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.lambda_function.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule.arn
}