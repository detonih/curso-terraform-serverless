resource "aws_dynamodb_table" "users" {
  name = "${var.environment}-users"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  # "${var.read_capacity}" usar desta forma esta deprecado
  # Usamos "${}" apenas quando há "interpolação" (ou concatenacao?)
  write_capacity = var.write_capacity
  read_capacity = var.read_capacity
}

# Exporta parametros no SSM
resource "aws_ssm_parameter" "dynamodb_users_table" {
  name = "${var.environment}-dynamodb-users-table"
  type = "String"
  # referenciamos outro recurso terraform. Exportamos o nome da tabela
  # Esse parâmetro exportado tem o valor ==> dev-users(nome da tabela)
  value = aws_dynamodb_table.users.name
}