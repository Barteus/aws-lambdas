# Deploy lambda - serverless

Serverless framework allows deploying functions on different providers. It works based on CloudFormation for AWS
provider. Lambda can be packaged for zip or docker image. Then it is uploaded to AWS artifact store (S3 or ECR),
CloudFormation stack is created and executed. Future updates can be done by redeployment or simple update of
configuration. Configuration changes are much faster than full redeployment. Deployment history is stored in form of
CloudFormation stacks.

Tool has more benefits when used with "Pro" version by providing Monitoring and CICD pipeline. Integration with lambda
triggers is also really swift - great for prototyping. when used in complex production scenarios there might be a need
for more advanced customizations, then there is a need to use plugins and CloudFormation scripts in serverless.yaml

The artifacts that are useful to check what was deployed are stored in `.serverless` folder. There is both the zip file
to upload and CloudFormation templates to create and update values. Be aware that are 2 different templates - one for
creation and one for update.

Create deployment - `sls create`

Deploy - `sls deploy`

Invoke lambda - `sls invoke -f hello -p ../test/event.json`

Destroy - `sls remove`

PROS:

- many plugins which extends serverless basic deployment function (like installation of dependencies)
- easy integration with lambda triggers like API Gateway or S3
- allows lambda function execution in local simulated environment - `sls invoke local`
- supports CICD, Secrets and Monitoring in "Pro" version (free for single developers, paid for teams)
- declarative approach where you define a state you want to archive
- allows file filtering which should be a part of deployed application
- allows creation of resources with CloudFormation yamls
- history of all deployments is kept in form of CloudFormation stacks
- allows multi-cloud approach
- can be easily used with other IaC tools (adding more than one IaC tool to project is not the best idea, but can be
  done)
- native support for multiple environments

CONS:

- slower than terraform
- documentation of more advanced scenarios would be nice
- missing possibility to review plan before apply
- statistic and usage tracking enabled by default
- enforcing some conventions on lambda functions (less configurable)
- advanced resource customizations has to be written in CloudFormation or found in plugins
- issues debugging is cumbersome
- adds not needed files in default configuration of serverless app (fixed using including/excluding in example)
