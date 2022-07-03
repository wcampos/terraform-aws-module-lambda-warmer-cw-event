variable "function_name" {
  type        = string
  default     = ""
  description = "Name of the lambda function to warm"

}

variable "warmer_rate" {
  type        = number
  default     = "5"
  description = "Time interval to warm the function"
}