# Terraform AWS module for Lambda Warmer CW Event

The module will deploy a CloudWatch Event Rule that keep the lambda warm based on a time interval (default: 5m)

## How to use

Example
```bash 
module "my_lambda_function_warmer_name" {
    function_name = "myLambdaFunctionName"
    warmer_rate   = 10
}
```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.lambda_warmer_cw_event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.lambda_warmer_event_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_lambda_permission.lambda_warmer_invoke_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lambda_function) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Name of the lambda function to warm | `string` | `""` | no |
| <a name="input_warmer_rate"></a> [warmer\_rate](#input\_warmer\_rate) | Time interval to warm the function | `number` | `"5"` | no |

## Outputs

No outputs.
