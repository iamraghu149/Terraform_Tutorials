resource "aws_instance" "web" {
  ami = "ami-09298640a92b2d12c"
  instance_type = "t2.micro"
  count = 5

  tags = {
    Name = "HelloWorld"
  }
}
