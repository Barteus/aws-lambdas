provider "aws" {}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "bpk-lambda-function"
  description = "My Lambda function"
  handler = "handle.lambda_handler"
  runtime = "python3.7"

  source_path = "../code"

  layers = [
    module.lambda_layer.this_lambda_layer_arn]
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = module.lambda_function.lambda_role_name
}

module "lambda_layer" {
  source = "terraform-aws-modules/lambda/aws"

  create_layer = true

  layer_name = "bpk-layer"
  description = "My lambda layer"
  compatible_runtimes = [
    "python3.7"]

  source_path = "../layer"
}
