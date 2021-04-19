# Deploy lambda - serverless

Serverless framework allows deploying functions on different providers. Works based on CloudFormation for AWS provider.
Tool has more benefits when used with "Pro" version by providing Monitoring and CICD pipeline. Integration with lambda
triggers is also really swift - great for prototyping, when used in complex production scenarios there might be a need
for more advanced customizations. Then there is a need to use CloudFormation scripts in serverless.yaml

Create deployment - `sls create`

Deploy - `sls deploy`

Destroy - `sls remove`

PROS:

- many plugins which extends serverless basic deployment function (like adding dependencies)
- easy integration with lambda triggers like API Gateway or S3
- allows lambda function execution in local simulated environment - `sls invoke local`
- supports CICD, Secrets and Monitoring in "Pro" version (free for single developers, paid for teams)
- declarative approach where you define a state you want to archive
- allows creation of resources with CloudFormation yamls
- allows multi-cloud approach and can create other resources (i.e. Kubernetes resources)

CONS:

- slower than terraform
- documentation of more advanced scenarios would be nice
- missing plan which could be reviewed before apply
- statistic and usage tracking enabled by default
- enforcing name convention standards on lambda functions
- advanced customizations has to be written in CloudFormation
- issues debugging is cumbersome
