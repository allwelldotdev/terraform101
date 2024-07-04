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
      Sid = "PublicRead-GetObject-GetObjectACL-PutObjectACL"
      Action = [
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:PutObjectAcl"
      ]
      Effect    = "Allow"
      Resource  = "${aws_s3_bucket.static_website.arn}/*"
      Principal = "*"
    }]
  })

  depends_on = [aws_s3_bucket.static_website, aws_s3_bucket_public_access_block.static_website]
}

# Set s3 bucket to static website, select index and error doc

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

# Deploy index.html file

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "index.html"
  source       = "build/index.html"
  etag         = filemd5("build/index.html")
  content_type = "text/html"
}

# Deploy style.css file

resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "style.css"
  source       = "build/style.css"
  etag         = filemd5("build/style.css")
  content_type = "text/css"
}

# Deploy img/ folder

resource "aws_s3_object" "img_dir" {
  bucket = aws_s3_bucket.static_website.id
  key    = "img/"
  source = "build/img/"
}

# Deploy files in img/ folder...

resource "aws_s3_object" "img_dropdown" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "img/dropdown.svg"
  source       = "build/img/dropdown.svg"
  etag         = filemd5("build/img/dropdown.svg")
  content_type = "img/svg"
  acl          = "public-read"
}

resource "aws_s3_object" "img_eye" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "img/eye.svg"
  source       = "build/img/eye.svg"
  etag         = filemd5("build/img/eye.svg")
  content_type = "img/svg"
  acl          = "public-read"
}

resource "aws_s3_object" "img_logo" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "img/logo.svg"
  source       = "build/img/logo.svg"
  etag         = filemd5("build/img/logo.svg")
  content_type = "img/svg"
  acl          = "public-read"
}

resource "aws_s3_object" "img_date" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "img/date.svg"
  source       = "build/img/date.svg"
  etag         = filemd5("build/img/date.svg")
  content_type = "img/svg"
  acl          = "public-read"
}

