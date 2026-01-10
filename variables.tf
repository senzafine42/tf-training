variable "region" {
  type        = string
  description = "AWS region to deploy into."
  default     = "us-east-1"
}

variable "bucket_name" {
  type        = string
  description = "Globally-unique S3 bucket name."
}
