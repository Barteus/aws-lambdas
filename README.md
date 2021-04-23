# AWS Lambda deployment tools

Lambdas are used frequently - microservices, data pipelines, devops automation projects, cloud automation and many more.
Selection of the lambda deployment mechanism is important. It can speed up development or prototyping work or slow it
down significantly.

This project is showing few ways to deploy lambda. Each way is a bit different and can be used for different purposes.
Enjoy!

## Lambda deployment

Lambdas are deployed based on 2 types of artifacts:

- Zip packages (direct upload or via S3)
- Docker images (from ECR using AWS provided base image or own)

### When to use which?

This depeneds on the size of lambda - generally it is better to use Zip packages in small lambdas. There is a limit for
using Zip packages - over 250MB (including dependencies, all uncompressed) you can use only Docker Images. If
application is larger then 50MB - direct upload will not work. Use S3 bucket as an artifact storage for deployment.

## Approaches - deployment tools

Common for all lambdas invoke script was placed in folder `test`
To test lambdas execution create a bucket, place a file, add metadata and based on `event.json.tpl` create `event.json`
with filled values. Lambda invoke script is in `invoke.sh`

Application is placed in `code` folder and will be used by all approaches. Application based on file in S3 bucket
returns its metadata using boto3 library.

Each approach contains:

- deploy, destroy scripts or README commands to run (i.e. for terraform)
- README with description of PRO/CONS and some challenges

### Explored methods by folder:

- `manual` - bash scripts, aws cli
- `terraform` - terraform scripts
- `serverless` - serverless framework configuration files
- `sam` - AWS SAM deployment

### Alternatives - not explored

- Zappa
- ClaudiaJS
- Heroku
- AWS CDK (Cloud Development Kit)
- Up
- Architect

## Summary

After exploring 4 different approaches to lambda deployment each has its own merits and driver to consider.

### Manual

This is a great approach for educational purposes. It can clearly show the short commings and required feature to look
for when selecting tools. People who implemented this basic approach by themselves understand lambda deployment
mechanism better.

Recommended: education only

### Terraform

This approach has few versions of implementation. The one implemented in this repository was selected because of short
form and coverage of most important features. It does not support debugging, logging or local execution - features which
might come in handy. Terraform focus mainly on deployment part.

Recommended:

- selected IaC is Terraform
- multi-cloud environment
- do not care about lambda development helpers - aws cli can be a replacement for most of them

### Serverless

This approach uses tool created especially for developing serverless application. Supports multiple providers to deploy
serverless solutions in multi-cloud environments. Works based on AWS CloudFormation stack (for AWS provider) and
provides nice integration with multiple triggers (like API Gateway). Supports development tools like local and remote
execution, logging. In "Pro" version gives out-of-the-box CICD pipeline. Can be mixed with IaC tools like Terraform.

Recommended:

- easy integration with different triggers
- there are plugins available for all needed extensions
- focus on tool to develop lambdas (incl. local execution)
- multi-cloud environments
- CloudFormation as IaC tool

### AWS SAM

Approach focused only on AWS serverless applications. Application consists of many lambdas and resources around them (
like S3 buckets, API Gateways). Cli generates a whole project including tests based on given template, which gives a way
to standardize serverless application development. Cli supports nicely code development, deployment and troubleshooting.
During deployment and writing different lambdas there was no need to jump back to AWS console - all needed data can be
easily extracted form AWS SAM cli.

Recommended:

- deployment of multiple lambdas as a part of bigger application
- leverage of SAM application repository (public and private)
- focus on tool to develop lambdas (incl. local execution)
- CloudFormation as IaC tool

## Links

- https://docs.aws.amazon.com/cli/latest/reference/
- https://docs.aws.amazon.com/lambda/latest/dg/lambda-python.html
- https://www.serverless.com/learn/comparisons/
- https://aws.amazon.com/blogs/opensource/24-open-source-tools-for-the-serverless-developer-part-1/
- https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/latest
- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html
- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html
- https://www.serverless.com/examples/
- https://www.serverless.com/framework/docs/
