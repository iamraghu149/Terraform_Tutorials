#terraform code to launch EC2 instance

resource "aws_instance" "Raghu" {
  ami = "ami-007020fd9c84e18c7"        #Ubuntu Linux AMI
  instance_type = "t2.micro"
  security_groups = [aws_security_group.TF_SG.name]
  key_name = "TF_key"
  tags = {
    Name = "TerraformEC2"
  }

  #USERDATA in AWS EC2 using Terrafrom here I have added script.sh files rest all are same code as previous one.
  user_data = file("script.sh")
              
}

resource "aws_key_pair" "TF-key" {
  key_name = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
} 

resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
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
