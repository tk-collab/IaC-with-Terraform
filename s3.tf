resource "aws_s3_bucket" "static" {
  bucket = "${var.name_base}-static-website-bucket"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = "${var.name_base}-StaticWebsiteBucket"
  }
}

resource "aws_s3_bucket_public_access_block" "static" {
  bucket = aws_s3_bucket.static.id

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static" {
  bucket = aws_s3_bucket.static.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        AWS = aws_iam_role.instance_role.arn
      }
      Action   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
      Resource = "${aws_s3_bucket.static.arn}/*"
    }]
  })
}
