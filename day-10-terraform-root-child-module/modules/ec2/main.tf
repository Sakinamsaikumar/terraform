resource "aws_instance" "server" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  key_name          = var.key_name
  availability_zone = var.az

  tags = {
    Name = "ec2-server"
  }
}
