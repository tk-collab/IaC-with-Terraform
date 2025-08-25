resource "aws_db_subnet_group" "main" {
  name       = "raise-db-subnet-group" # 小文字のみ、ハイフン可
  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "Raise-DBSubnetGroup"
  }
}
