resource "aws_s3_bucket" "mybucket" {
  bucket = "zoomops-solutions"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "My Bucket"
    Environment = "Dev"
  }
}
