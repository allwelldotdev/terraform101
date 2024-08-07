resource "aws_s3_bucket" "tainted" {
  bucket = "random-name-123293n9d"
}

resource "aws_s3_bucket_public_access_block" "from_tainted" {
  bucket = aws_s3_bucket.tainted.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  lifecycle {
    replace_triggered_by = [aws_s3_bucket.tainted]
  }
}
