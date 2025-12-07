module "prod" {
    source="value"
  ami_id =  "ami-0c5204531f799e0c6"
  instance_type = "t2.micro"
 # key = "test"
  availability_zone = "us-west-2a"

}