provider "aws" {
  region = "ap-south-1"   # Change to your preferred region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-2025"  # Bucket name must be globally unique

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable public access block (recommended)
  acl = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
    Owner       = "Ravi"
  }
}

# Optional: Output the bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}
