

resource "aws_instance" "day_5" {
  ami           = "ami-0892d3c7ee96c0bf7"
  instance_type = "t2.micro"
  tags = {
    Name = "state"
  }
}
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
  
}
resource "aws_vpc" "name2" {
    cidr_block = "10.0.0.0/24"
  
}