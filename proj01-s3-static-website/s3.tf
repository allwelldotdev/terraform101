resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "static_website" {
  bucket = "terraform-course-project-1-${random_id.bucket_suffix.hex}"
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_website_public_read" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadGetObject"
      Action    = ["s3:GetObject"]
      Effect    = "Allow"
      Resource  = "${aws_s3_bucket.static_website.arn}/*"
      Principal = "*"
    }]
  })

  depends_on = [aws_s3_bucket.static_website, aws_s3_bucket_public_access_block.static_website]
}

# resource "aws_s3_bucket_website_configuration" "static_website" {
#   bucket = aws_s3_bucket.static_website.id

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "index.html"
#   }
# }
