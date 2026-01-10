variable "bucket_name" {
  type        = string
  description = "Globally-unique S3 bucket name."
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, prod, etc.)."
}

variable "project" {
  type        = string
  description = "Project name."
}
