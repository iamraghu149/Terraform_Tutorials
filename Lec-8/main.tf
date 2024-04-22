provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

resource "aws_instance" "Web-Server" {
  ami = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"

  tags = {
    Name = "Server"
  }
}
