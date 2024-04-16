resource "aws_instance" "web" {
  ami           = ami-09298640a92b2d12c
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}