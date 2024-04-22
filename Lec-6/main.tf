#depends_on

#resource "aws_instance" "Web-Server" {
  #ami = "ami-007020fd9c84e18c7"
  #instance_type = "t2.micro"
  #depends_on = [
    #aws_s3_bucket.mybucket
   #]
#}

#resource "aws_s3_bucket" "mybucket" {
  #bucket = "iamraghu149"
#}
##---------------------------------------##

#depends_on 2nd Example

resource "aws_instance" "Server" {
  ami = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "iamraghu149"
  depends_on = [ 
    aws_instance.Server
   ]
}
