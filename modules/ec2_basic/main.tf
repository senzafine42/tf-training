locals {
  tags = {
    Name        = var.name
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group" "this" {
  name_prefix = "${var.name}-"
  description = "Basic SG for ${var.name}"
  vpc_id      = var.vpc_id

  # No inbound by default (private). Add SSH only if enabled.
  dynamic "ingress" {
    for_each = var.enable_ssh ? [1] : []
    content {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = var.ssh_ingress_cidrs
    }
  }

  # Allow all outbound (common default)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]

  # If you enable SSH, you probably want a keypair; otherwise leave null.
  key_name = var.enable_ssh ? var.key_name : null

  # No public IP by default (depends on subnet settings, but this reinforces intent)
  associate_public_ip_address = false

  tags = local.tags
}
