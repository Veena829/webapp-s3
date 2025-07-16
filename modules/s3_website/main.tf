resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = var.tags
}

# Create the website configuration for the S3 bucket
resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

# Updated S3 Bucket Policy to allow public read access to all objects in the bucket
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.this.arn}/*"
    }]
  })
}

# Updated S3 Bucket Public Access Block to allow public access for the website
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
