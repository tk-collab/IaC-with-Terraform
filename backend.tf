terraform {
  backend "s3" {
    bucket         = "tf-handson-396608767997" # 事前に作成
    key            = "./terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "Terraform_test" # 事前に作成
    encrypt        = true
  }
}
