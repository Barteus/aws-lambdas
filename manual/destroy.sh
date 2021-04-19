#!/usr/bin/env bash
aws lambda delete-function --function-name bpk-lambda-function

aws iam detach-role-policy --role-name bpk-lambda-role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
aws iam detach-role-policy --role-name bpk-lambda-role --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam delete-role --role-name bpk-lambda-role
