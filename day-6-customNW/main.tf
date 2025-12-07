#vpc creatrion
resource "aws_vpc" "name" {
cidr_block ="10.0.0.0/16"
tags = {
  Name = "test"
  }
  
}
#subnet creation
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block ="10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "test-subnet"
      }

}
#internet gateway
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "test-igw"
      }
  
}
#route table
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
}

#subnet association   
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
  
}

#SG group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow SSH and HTTPS inbound traffic"
  vpc_id      = aws_vpc.name.id

  # SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

#Nat 
#EC2 instance creation 

resource "aws_instance" "name" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.name.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true

  tags = {
    Name = "test-instance"
  }
}

