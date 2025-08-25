# variable "aws_region" {
#   description = "AWSリージョン"
#   type        = string
# }

# variable "project_name" {
#   description = "プロジェクト名（リソース名のプレフィックスに使用）"
#   type        = string
# }

# variable "key_name" {
#   description = "既存のEC2キーペア名"
#   type        = string
# }

variable "name_base" {
  description = "Base name for resources"
  type        = string
  default     = "RaiseTekkun"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "raiseTech_keypair_lecture05"
}
