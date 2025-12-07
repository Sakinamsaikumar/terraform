variable "ami_id" {
  description = "inserting ami value into main"
  type =string
  default = ""
}
variable "instance_type" {
    type = string
    default = ""
  
}
variable "key" {
    type = string
    default = "test"
  
}
variable "availability_zone" {
    type = string
    default = "us-west-2a"
  
}
variable "bucket_name" {
    default = ""
  
}