resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket0149"
}


resource "aws_instance" "Web" {
  ami = "ami-007020fd9c84e18c7"
  count = 3
  instance_type = var.size
  depends_on = [aws_s3_bucket.mybucket]

  tags = {
    Name = "Hello-Raghu-${count.index+1}"
  }
}
