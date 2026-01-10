# Terraform – Private S3 Bucket (Module Example)

This project demonstrates a **very basic Terraform setup** that creates a
**private AWS S3 bucket** using a reusable module.

The goal is to practice:
- Terraform project structure
- Creating and calling modules
- Basic AWS S3 security defaults

---

## What This Creates

- One S3 bucket
- Bucket ownership set to **BucketOwnerEnforced** (ACLs disabled)
- **All public access blocked**
- Outputs for bucket name and ARN

No public access, no policies, no extras.

---

## Project Structure
```
s3-basic-private/
  ├─ main.tf
  ├─ variables.tf
  ├─ outputs.tf
  ├─ versions.tf
  ├─ README.md
  ├─ .gitignore
  └─ modules/
    └─ s3_private_bucket/
      ├─ main.tf
      ├─ variables.tf
      └─ outputs.tf
```
```

---

## Requirements

- Terraform >= 1.5.0
- AWS credentials configured locally (AWS CLI, environment variables, or SSO)

---

## Usage

### Initialize Terraform
```bash
terraform init
```
Format and Validate
```
terraform fmt
terraform validate
```
Plan
```
terraform plan -var="bucket_name=your-unique-bucket-name"
```
Apply
```
terraform apply -var="bucket_name=your-unique-bucket-name"
```
Destroy
```
terraform destroy -var="bucket_name=your-unique-bucket-name"
```
