resource "aws_instance" "Web" {
  ami = "ami-007020fd9c84e18c7"
  instance_type = var.size

  tags = {
    Name = "Hello-Raghu"
  }
}
