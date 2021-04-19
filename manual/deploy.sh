#!/usr/bin/env bash
aws iam create-role --role-name bpk-lambda-role --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
aws iam attach-role-policy --role-name bpk-lambda-role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
aws iam attach-role-policy --role-name bpk-lambda-role --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

rm code.zip
zip -X -r code.zip ../code

# Read README why used!
sleep 10

ROLE_ARN=$(aws iam get-role --role-name bpk-lambda-role | jq -r .Role.Arn)
aws lambda create-function --function-name bpk-lambda-function --zip-file fileb://code.zip --handler code.handle.lambda_handler --runtime python3.8 --role $ROLE_ARN
