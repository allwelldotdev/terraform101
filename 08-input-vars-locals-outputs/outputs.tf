output "ubuntu_aws_ami_object" {
  value = data.aws_ami.ubuntu.id
}

output "s3_bucket_name" {
  value     = aws_s3_bucket.project_bucket.bucket
  sensitive = true
}

output "sensitive_var" {
  value     = var.my_sensitive_value
  sensitive = true
}
