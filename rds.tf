data "aws_ssm_parameter" "rds_master_password" {
  name            = "/rds/master/password"
  with_decryption = true
}

resource "aws_db_instance" "main" {
  identifier              = "my-rds-instance"
  engine                  = "mysql"
  engine_version          = "8.0.40"
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  multi_az                = false
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.rds.id]
  username                = "admin"
  password                = data.aws_ssm_parameter.rds_master_password.value
  backup_retention_period = 0
  tags = {
    Name = "RaiseTekkun-RDS"
  }
}
