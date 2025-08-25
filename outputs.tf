output "website_url" {
  description = "URL of the static website"
  value       = "http://${aws_s3_bucket.static.bucket}.s3-website-${data.aws_region.current.name}.amazonaws.com"
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.this.dns_name
}

output "cloudfront_domain" {
  description = "CloudFront Distribution Domain Name"
  value       = aws_cloudfront_distribution.this.domain_name
}

output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.web.public_ip
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.static.id
}

data "aws_region" "current" {}
