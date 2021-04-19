provider "aws" {}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "bpk-lambda-function"
  description   = "My Lambda function"
  handler       = "handle.lambda_handler"
  runtime       = "python3.8"

  source_path = "../code"
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = module.lambda_function.lambda_role_name
}
