# policy propriamente dita
resource "aws_iam_policy" "policy" "register_policy" {
  name        = "${var.environment}-register-policy"
  description = "Policy for ..."

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:PutItem"
      ],
      "Effect": "Allow",
      "Resource": "${aws_dynamodb_table.users.arn}" 
    }
  ]
}
EOF
# "Action": "service-prefix:action-name", serviço e nome da ação
# "Resource": "*" qual recurso queremos deixar que o PutItem seja efetuado
}