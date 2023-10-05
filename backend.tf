# terraform {
#   backend "s3" {
#     bucket = "terraform-assignment-5-bucket"
#     key    = "terraform.tfstate"
#     region = "ap-south-1"
#     dynamodb_table = "terraform-state-table"
#   }
# }