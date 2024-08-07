/*
Two methods of importing resources
from cloud infrastructure to Terraform config
1. Using the Terraform CLI
2. Using the Terraform import block
*/

# import {
#   to = aws_s3_bucket.remote-state
#   id = "add-demo-s3-v1"
# }

resource "aws_s3_bucket" "remote_state" {
  bucket = "add-demo-s3-v1"

  tags = {
    ManagedBy = "Terraform"
    Lifecycle = "Critical"
  }

  lifecycle {
    prevent_destroy = true
  }
}

# import {
#   to = aws_s3_bucket_public_access_block.remote_state
#   id = "add-demo-s3-v1"
# }

resource "aws_s3_bucket_public_access_block" "remote_state" {
  bucket = aws_s3_bucket.remote_state.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
