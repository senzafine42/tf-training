variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-2"
}

variable "bucket_name" {
  description = "Globally-unique S3 bucket name (lowercase, no spaces)."
  type        = string
}
