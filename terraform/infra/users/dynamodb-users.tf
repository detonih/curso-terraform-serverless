resource "aws_dynamodb_table" "users" {
  name = "${var.environment}-users"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  write_capacity = "${var.write_capacity}"
  reade_capacity = "${var.read_capacity}"
}

# Exporta parametros no SSM
resource "aws_ssm_parameter" "dynamodb_users_table" {
  name = "${var.environment}-dynamodb-users-table"
  type = "String"
  # referenciamos outro recurso terraform. Exportamos o nome da tabela
  value = "${aws_dynamodb_table.users.name}"
}