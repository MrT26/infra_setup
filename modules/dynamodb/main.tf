resource "aws_dynamodb_table" "my-dynamo-table" {
  name = var.aws-dynamodb-name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
  name = "LockID"
  type = "S"
  }
}