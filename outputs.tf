output "cloudwatch_event_rule_arn" {
  description = "ARN of the CloudWatch Event rule"
  value       = try(aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule[0].arn, "")
}

output "cloudwatch_event_rule_name" {
  description = "Name of the CloudWatch Event rule"
  value       = try(aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule[0].name, "")
}

output "lambda_permission_id" {
  description = "ID of the Lambda permission"
  value       = try(aws_lambda_permission.lambda_warmer_invoke_permissions[0].id, "")
} 