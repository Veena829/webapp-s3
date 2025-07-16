output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

# Access the website endpoint using the region from the variable
output "website_endpoint" {
  value = "http://${aws_s3_bucket_website_configuration.this.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}
