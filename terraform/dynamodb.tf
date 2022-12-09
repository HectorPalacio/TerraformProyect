resource "aws_dynamodb_table" "this" {
  name         = local.namespaced_service_name
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "N"
  }
}

resource "aws_dynamodb_table_item" "this" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key

  item = <<ITEM
{
  "id": {"N": "1"},
  "identification": {"S": "1234567890"},
  "firsName": {"S": "Hector Ivan"},
  "lastName": {"S": "Palacio Rivas"},
  "phone": {"S": "3004579140"},
  "email": {"S": "hpalacio@unicesar.edu.co"}
}
ITEM
}
