provider "aws" {
  region = var.region
}

# 1) Create the bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

# 2) Make ownership 'BucketOwnerEnforced' (ACLs disabled)
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# 3) Block ALL public access (keeps it private)
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
