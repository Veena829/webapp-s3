variable "bucket_name" {
  type        = string
  description = "Unique name for the S3 bucket"
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy in"
  default     = "ap-south-1"
}
