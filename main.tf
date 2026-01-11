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
