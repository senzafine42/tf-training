provider "aws" {
  region = var.region
}

module "s3_private_bucket" {
  source      = "./modules/s3_private_bucket"
  bucket_name = local.bucket_name
  environment = var.environment
  project     = var.project
}

resource "random_integer" "tf-training" {
  min = 10000
  max = 99999
}

locals {
  date = formatdate("YYYY-MM-DD", timestamp())

  bucket_name = format(
    "%s-%s-%d",
    var.project,
    local.date,
    random_integer.tf-training.result
  )
}

data "aws_vpc" "default" {
  default = true
}

module "ec2_basic" {
  source = "./modules/ec2_basic"

  name          = "${var.project}-${var.environment}-basic"
  vpc_id        = data.aws_vpc.default.id
  subnet_id     = aws_subnet.default_vpc_subnet.id
  instance_type = var.instance_type

  environment = var.environment
  project     = var.project

  # keep private by default:
  enable_ssh = false
  # if you later enable ssh:
  # enable_ssh        = true
  # ssh_ingress_cidrs = ["YOUR.PUBLIC.IP.ADDRESS/32"]
  # key_name          = "your-keypair-name"
}

resource "aws_subnet" "default_vpc_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project}-${var.environment}-subnet"
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group" "ssh" {
  name_prefix = "${var.project}-${var.environment}-ssh-"
  description = "Allow SSH access"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ingress_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "terraform"
  }
}
