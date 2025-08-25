# terraform {
#   required_version = ">= 1.5.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# # provider "aws" {
# #   region = var.aws_region
# # }

# module "vpc" {
#   source       = "./modules/vpc"
#   project_name = var.project_name
# }

# module "security" {
#   source   = "./modules/security"
#   project_name = var.project_name
#   vpc_id   = module.vpc.aws_vpc_main.id
# }

# module "iam" {
#   source       = "./modules/iam"
#   project_name = var.project_name
# }

# module "s3" {
#   source       = "./modules/s3"
#   project_name = var.project_name
# }

# module "ec2" {
#   source               = "./modules/ec2"
#   project_name         = var.project_name
#   ami_id               = "ami-06d57dd2fd67ed507"
#   instance_type        = "t2.micro"
#   subnet_id            = module.vpc.aws_subnet_public[0].id
#   app_sg_id            = module.security.elb_sg_id
#   key_name             = var.key_name
#   iam_instance_profile = module.iam.ssm_instance_profile_name
# }

# module "alb" {
#   source            = "./modules/alb"
#   project_name      = var.project_name
#   vpc_id            = module.vpc.aws_vpc_main.id
#   public_subnet_ids = module.vpc.public_subnet_ids
#   alb_sg_id         = module.security.elb_sg_id
# }
