resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.name_base}-VPC"
  }
}

data "aws_availability_zones" "available" {}

# resource "aws_route_table_association" "public_1" {
#   subnet_id      = aws_subnet.public_1.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public_2" {
#   subnet_id      = aws_subnet.public_2.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "private_1" {
#   subnet_id      = aws_subnet.private_1.id
#   route_table_id = aws_route_table.private.id
# }

# resource "aws_route_table_association" "private_2" {
#   subnet_id      = aws_subnet.private_2.id
#   route_table_id = aws_route_table.private.id
# }