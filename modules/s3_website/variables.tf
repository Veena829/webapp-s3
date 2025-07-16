variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "index_document" {
  type        = string
  description = "The index document (usually index.html)"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "The error document"
  default     = "error.html"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the bucket"
  default     = {}
}
variable "aws_region" {
  type        = string
  description = "AWS region to deploy in"
  default     = "us-east-1"
}
