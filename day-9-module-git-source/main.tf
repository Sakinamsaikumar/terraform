module "prod" {
  source = "git::https://github.com/Sakinamsaikumar/terraform.git//day-9-modules"
   ami_id =  "ami-0c5204531f799e0c6"
  instance_type = "t2.micro"
 # key = "test"
  availability_zone = "us-west-2a"

}