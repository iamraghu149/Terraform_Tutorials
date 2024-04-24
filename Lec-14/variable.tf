variable "size" {
  type = string
  default = "t2.micro"
  description = "This is instance size"
}

output "Privateip" {
  value = aws_instance.Web[1].private_ip
}

