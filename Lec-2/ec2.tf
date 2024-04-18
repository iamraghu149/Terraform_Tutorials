#terraform code to launch EC2 instance

resource "aws_instance" "Raghu" {
  ami = "ami-09298640a92b2d12c"        #Amazon Linux AMI
  instance_type = "t2.micro"
  security_groups = [aws_security_group.TF_SG.name]
  #count = 5

  tags = {
    Name = "TerraformEC2"
  }
}

#Security Groups Using Terraform

resource "aws_security_group" "TF_SG" {
  name = "security groups using terraform"
  description = "security groups using terraform"
  vpc_id = "vpc-06a817b193de1d0a5"

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "TF_SG"
  }
}
