#terraform code to launch EC2 instance

resource "aws_instance" "Raghu" {
  ami = "ami-09298640a92b2d12c"        #Amazon Linux AMI
  instance_type = "t2.micro"
  security_groups = [aws_security_group.TF_SG.name]
  #count = 5
  #First Method "that means Create manually on AWS Console and attach it here using below code line no.9"
  key_name = "TF_key"

  tags = {
    Name = "TerraformEC2"
  }
}

#Second method for Key_pair  "Once run the below code then go to Under 1st method one and change the key as demo to "TF_key" and run terraform apply again "

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
