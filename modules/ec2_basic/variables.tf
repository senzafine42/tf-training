variable "name" {
  description = "Name prefix for resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to launch into."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch into."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "enable_ssh" {
  description = "If true, opens port 22 from ssh_ingress_cidrs."
  type        = bool
  default     = false
}

variable "ssh_ingress_cidrs" {
  description = "Allowed CIDRs for SSH when enable_ssh = true."
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "Optional EC2 key pair name (required if enable_ssh = true and you want SSH access)."
  type        = string
  default     = null
}

variable "environment" {
  description = "Environment tag."
  type        = string
}

variable "project" {
  description = "Project tag."
  type        = string
}
