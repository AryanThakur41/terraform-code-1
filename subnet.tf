resource "aws_subnet" "subnet-1" {
  vpc_id            = "vpc-03918e0276383675c"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "subnet-1"
  }
}
resource "aws_subnet" "subnet-2" {
  vpc_id            = "vpc-03918e0276383675c"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "subnet-2"
  }
}
# resource "aws_subnet" "public_subnet" {
#   vpc_id            = "vpc-03918e0276383675c"
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "us-west-2b"

#   tags = {
#     Name = "public_subnet"
#   }
# }
# resource "aws_subnet" "private_subnet" {
#   vpc_id            = "vpc-03918e0276383675c"
#   cidr_block        = "10.0.4.0/24"
#   availability_zone = "us-west-2b"

#   tags = {
#     Name = "private_subnet"
#   }
# }