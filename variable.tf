variable "function_name" {
  type        = string
  description = "Name of the lambda function to warm"
  validation {
    condition     = length(var.function_name) > 0
    error_message = "function_name cannot be empty"
  }
}

variable "warmer_rate" {
  type        = number
  default     = 5
  description = "Time interval in minutes to warm the function"
  validation {
    condition     = var.warmer_rate >= 1 && var.warmer_rate <= 1440
    error_message = "warmer_rate must be between 1 and 1440 minutes"
  }
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to enable the lambda warmer"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources"
}

variable "description" {
  type        = string
  default     = null
  description = "Description for the CloudWatch Event rule"
}

variable "target_input" {
  type        = string
  default     = "{}"
  description = "Input to pass to the Lambda function when warming"
}