resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terra_vpc"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = "vpc-03918e0276383675c"

  tags = {
    Name = "igw"
  }
}
resource "aws_security_group" "instance_sg" {
  vpc_id = "vpc-03918e0276383675c"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# resource "aws_vpc_attachment" "igw_attachment" {
#   vpc_id            = "vpc-03918e0276383675c"
#   internet_gateway_id = "igw-002b089f7e7a9db4e"
# }

resource "aws_route_table" "public_route_table" {
  vpc_id = "vpc-03918e0276383675c"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-01b471da1596f440e"
  }

  tags = {
    Name = "public_route_table"
  }
}