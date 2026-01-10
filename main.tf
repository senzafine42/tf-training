provider "aws" {
  region = var.region
}

module "s3_private_bucket" {
  source      = "./modules/s3_private_bucket"
  bucket_name = var.bucket_name
}
