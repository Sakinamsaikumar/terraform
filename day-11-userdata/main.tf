resource "aws_instance" "name" {
   ami = "ami-0892d3c7ee96c0bf7"
   instance_type = "t2.micro"
   user_data = file("test.sh")
   
}