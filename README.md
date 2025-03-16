# Terraform AWS module for Lambda Warmer CW Event

This module creates a CloudWatch Event Rule that keeps a Lambda function warm by periodically invoking it based on a configurable time interval.

## Features

- Configurable warming interval (1-1440 minutes)
- Optional enabling/disabling of the warmer
- Custom input payload support for Lambda invocation
- Resource tagging support
- Custom description for CloudWatch Event rule
- Input validation for required parameters
- Timestamp-based versioning on master branch pushes
- Automated Terraform validation

## Usage

```hcl
module "lambda_warmer" {
  source = "github.com/wcampos/terraform-aws-module-lambda-warmer-cw-event?ref=v20240316123456"

  function_name = "my-lambda-function"
  warmer_rate   = 5  # Warm every 5 minutes
  enabled       = true
  description   = "Custom description for the warmer"
  target_input  = jsonencode({ "warmup": true })
  
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Versioning

This module uses timestamp-based versioning (YYYYMMDDhhmmss format). You can find all available versions in the [releases page](https://github.com/wcampos/terraform-aws-module-lambda-warmer-cw-event/releases).

### Automatic Versioning

The module uses GitHub Actions to automatically:
1. Validate Terraform code:
   - Check formatting
   - Initialize Terraform
   - Validate configuration
2. Create releases (on master branch push only):
   - Create a new version tag using the current timestamp
   - Create a GitHub release with the new version
   - Tag the release in Git

For example, if you push to master on March 16, 2024 at 12:34:56, it will create version `v20240316123456`.

To use a specific version of the module, specify the version in the source URL:

```hcl
module "lambda_warmer" {
  source = "github.com/wcampos/terraform-aws-module-lambda-warmer-cw-event?ref=v20240316123456"
  # ... rest of the configuration
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |

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
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Name of the lambda function to warm | `string` | n/a | yes |
| <a name="input_warmer_rate"></a> [warmer\_rate](#input\_warmer\_rate) | Time interval in minutes to warm the function (1-1440) | `number` | `5` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to enable the lambda warmer | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the CloudWatch Event rule | `string` | `null` | no |
| <a name="input_target_input"></a> [target\_input](#input\_target\_input) | Input to pass to the Lambda function when warming | `string` | `"{}"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_event_rule_arn"></a> [cloudwatch\_event\_rule\_arn](#output\_cloudwatch\_event\_rule\_arn) | ARN of the CloudWatch Event rule |
| <a name="output_cloudwatch_event_rule_name"></a> [cloudwatch\_event\_rule\_name](#output\_cloudwatch\_event\_rule\_name) | Name of the CloudWatch Event rule |
| <a name="output_lambda_permission_id"></a> [lambda\_permission\_id](#output\_lambda\_permission\_id) | ID of the Lambda permission |

## License

This module is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
