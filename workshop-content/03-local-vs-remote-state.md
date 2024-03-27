# Local vs Remote State in Terraform

Terraform maintains state files to keep track of resources it manages. When deploying Terraform resources, Terraform will use this state information to determine what resources are being created, changed, or deleted when applying changes. It also helps Terraform understand the dependencies between resources so that it can provision them in the correct order.
When running the `terraform plan` or `terraform apply` command, Terraform will generate an execution plan, outlining what it intends to do. The plan compares the desired state (your configuration) with the current state (the state file).

## Local State

Terraform state is by default, stored locally. It is stored in a file called `terraform.tfstate` in the project's root directory. This file is auto-generated whenever you initialize a Terraform repository and is updated whenever a new change is applied.

Team members working on the same infrastructure would have their own copy of the state file and collaboration would require manual sharing of the state file.

## Remote State

With the remote state, Terraform stores the state data in a remote data store such as an Amazon S3 bucket. This is implemented by configuring a backend in the `terraform.tf` file. As the state is remote, other members of your team can access this shared state, ensuring that each team member has the latest state at all times.
Team members using only local state may be unaware of new state updates by other team members resulting in conflicting Terraform configurations.

## Why use Remote State over local state?

By using a remote state over just a local state, this supports a more seamless collaborative experience as there is no need for team members to manually share their local states. Remote states also provide concurrency safety through state locking mechanisms which prevents different team members from concurrently modifying the same state. Without this, conflicts and race conditions could emerge if state is not properly managed. Remotely stored state also adds an extra layer of resilience to the infrastructure as it is accessible from any machine.

## [NEXT SECTION - Remote state set-up 👉🏽](04-remote-state-set-up.md)
