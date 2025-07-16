terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "static_site" {
  source         = "./modules/s3_website"
  bucket_name    = var.bucket_name
  index_document = "index.html"
  error_document = "error.html"
  tags = {
    Environment = "dev"
    Project     = "StaticWebsite"
  }
}

resource "aws_s3_object" "index" {
  bucket       = module.static_site.bucket_name  # Reference to the bucket created in the module
  key          = "index.html"
  source       = "${path.module}/website/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = module.static_site.bucket_name  # Reference to the bucket created in the module
  key          = "error.html"
  content      = "<h1>404 - Not Found</h1>"
  content_type = "text/html"
}

# Output the URL of the static website
output "website_url" {
  value = "http://${module.static_site.website_endpoint}"
}
