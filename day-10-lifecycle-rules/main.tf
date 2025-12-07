resource "aws_instance" "name" {
  ami = "ami-02b297871a94f4bss42"
  instance_type = "t2.micro"
  key_name = "test"
  tags = {
    Name = "test"
  }
  lifecycle {
    create_before_destroy = true
  }
  #lifecycle {
  # ignore_changes = [tags]
 #}
  #lifecycle {
   #prevent_destroy = true
  #}
}
