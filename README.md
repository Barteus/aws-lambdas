# aws-lambdas - WORK IN PROGRESS

This project is showing few ways to deploy lambda. Each way is a bit different and can be used for different purposes.

## Lambda deployment

There are 2 main mechanisms for deploying lambda on AWS:

- Zip packages (direct upload or via S3)
- Docker images (using AWS provided base image or own)

### When to use which?

This depeneds on the size of lambda - generally it is better to use Zip packages in small lambdas. There is a limit for
using Zip packages - over 250MB (including dependencies, all uncompressed) you can use only Docker Images. If
application is larger then 50MB - direct upload will not work. Use S3 bucket as an artifact storage for deployment.

## Approaches

Common for all lambdas invoke script was placed in folder `test`
To test lambdas execution create a bucket, place a file, add metadata and based on `event.json.tpl` create `event.json`
with filled values. Lambda invoke script is in `invoke.sh`

Application is placed in `code` folder and will be used by all approaches. Application based on file in S3 bucket
returns its metadata using boto3 library.

Each approach contains:

- simple application code, which returns file's metadata
- deploy, destroy scripts or README commands to run (i.e. for terraform)
- README with description of PRO/CONS and some challenges

### Explored methods by folder:

- `manual` - bash scripts, aws cli
- `terraform` - terraform scripts
- **TODO** `sam` - AWS SAM deployment
- `serverless` - serverless framework configuration files

## Summary
**TODO**
