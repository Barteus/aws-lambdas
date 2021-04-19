#!/usr/bin/env bash

EVENT=$(base64 < event.json)
aws lambda invoke --function-name bpk-lambda-function --payload $EVENT output.json
echo Lambda Output:
cat output.json | jq
