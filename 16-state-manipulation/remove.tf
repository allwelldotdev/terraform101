/*
There are two methods of removing config from the tf state file:
1. Remove via Terraform CLI
2. Remove via the removed block
*/

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "random-name-12343j343"
# }

removed {
  from = aws_s3_bucket.my_new_bucket

  lifecycle {
    destroy = false
  }
}

# resource "aws_s3_bucket" "my_new_bucket" {
#   bucket = "random-name-1928323j"
# }

# import {
#   to = aws_s3_bucket.my_new_bucket-v2
#   id = "random-name-12343j343"
# }

removed {
  from = aws_s3_bucket.my_new_bucket-v2

  lifecycle {
    destroy = true
  }
}

# resource "aws_s3_bucket" "my_new_bucket-v2" {
#   bucket = "random-name-12343j343"
# }
