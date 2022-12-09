resource "aws_apigatewayv2_api" "this" {
  name          = "${local.namespaced_service_name}-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  name        = "clients_API_GW"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambdas_clients" {
  for_each = local.lambdas

  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  payload_format_version = "2.0"
  integration_uri        = aws_lambda_function.lambdas_clients[each.key].invoke_arn
}

resource "aws_apigatewayv2_route" "lambdas_clients" {
  for_each = local.lambdas

  api_id    = aws_apigatewayv2_api.this.id
  route_key = "${upper(each.key)} /api/clients"
  target    = "integrations/${aws_apigatewayv2_integration.lambdas_clients[each.key].id}"
}

resource "aws_apigatewayv2_route" "todos_get" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "GET /api/clients/{todoId}"
  target    = "integrations/${aws_apigatewayv2_integration.lambdas_clients["get"].id}"
}
