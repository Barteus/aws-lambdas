# Deploy lambda - terraform modules

There are a few ways to deploy lambda using terraform. We can use basic AWS provider resource modules and build the code
ourselves using CICD pipeline. I really like a quick approach using one of the officially approved modules from
Terraform Registry.

In production environment always use backends! For simulation this part was excluded intentionally.

Deploy - `terraform apply`

Destroy - `terraform destroy`

PROS:

- support for simple to complex scenarios including layers deployment
- declarative approach where you define a state you want to archive
- supports waiting for resources being created
- allows creation of resources
- allows multi-cloud approach and can create other resources (i.e. Kubernetes resources)
- supports both types of deployment which additional code (Zip/Docker Image)
- support for multiple environments in form of workspaces

CONS:

- does not support lambda execution/debugging
- module is still fresh and has some unresolved issues
- supports Python 3.6 or higher (for Python 2.7 build code and provide as artifact)


