output "cloudwatch_event_rule_arn" {
  description = "ARN of the CloudWatch Event rule"
  value       = aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule.arn
}

output "cloudwatch_event_rule_name" {
  description = "Name of the CloudWatch Event rule"
  value       = aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule.name
}

output "lambda_permission_id" {
  description = "ID of the Lambda permission"
  value       = aws_lambda_permission.lambda_warmer_invoke_permissions.id
} 