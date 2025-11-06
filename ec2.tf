resource "aws_iam_role" "instance_role" {
  name = "${var.name_base}-InstanceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.name_base}-SSMInstanceProfile"
  role = aws_iam_role.instance_role.name
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "s3" {
  role       = aws_iam_role.instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_instance" "web" {
  ami                    = "ami-06d57dd2fd67ed507"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_1.id
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name = "${var.name_base}-EC2Instance2"
  }

  user_data = <<-EOF
              #!/bin/bash -xe
              yum update -y
              yum install -y aws-cfn-bootstrap
              EOF
}
