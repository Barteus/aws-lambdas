# Deploy lambda - manual + aws cli

This is version which does not require knowledge of any additional tools other than bash and aws cli.

The implementation is using Lambda Zip direct upload which is fast to develop by does not allow for artifact

## Pros:

- simple and fast to implement
- great for education purposes

## Cons:

- update of lambda code requires different aws cli calls than creation (try running it twice)
- not declarative approach (you define steps, not an expected state)
- aws cli methods have eventual consistency (try commenting line 10 in `deploy.sh` )
- adding S3/ECR as artifact storage makes it even more complicated
