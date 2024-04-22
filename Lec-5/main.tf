resource "aws_instance" "Web" {
  ami = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"

  count = 5

  tags = {
    Name = "Instance ${count.index}"
  }
}
