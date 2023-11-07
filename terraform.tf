provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "oolaa-terraform-created-bucket"
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "my_object" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "CV.pdf"
  source = "../CV.pdf"
  etag   = filemd5("../CV.pdf")
}
