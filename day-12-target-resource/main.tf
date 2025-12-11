
provider "aws" {
  
}



resource "aws_instance" "name" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"  
    key_name = "test"

  
}

resource "aws_s3_bucket" "name" {
    bucket = "dfdslcvjcdlkfcdfsdfc"

}