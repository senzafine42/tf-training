variable "region" {
  type        = string
  description = "AWS region to deploy into."
  default     = "us-east-2"
}

# variable "bucket_name" {
#   type        = string
#   description = "Globally-unique S3 bucket name."
# }

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, prod, etc.)."
  default     = "dev"
}

variable "project" {
  type        = string
  description = "Project name."
  default     = "tf-training"
}

variable "security_group_ids" {
  description = "Security group IDs to attach to the instance."
  type        = list(string)
  default     = []
}


variable "instance_type" {
  type        = string
  description = "EC2 instance type."
  default     = "t3.nano"
}

variable "ssh_ingress_cidrs" {
  description = "CIDR blocks allowed to SSH (port 22)"
  type        = list(string)
  default     = ["0.0.0.0/0"] # tighten later
}

variable "subnet_cidr" {
  description = "CIDR block for the new subnet"
  type        = string
  default     = "172.31.128.0/20"
}

variable "availability_zone" {
  description = "AZ for the subnet"
  type        = string
  default     = "us-east-2a"
}
