
provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "name" {
    ami = "ami-0ebf411a80b6b22cb"
    instance_type = "t2.micro"
  
}