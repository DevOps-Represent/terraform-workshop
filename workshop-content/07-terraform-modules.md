# Terraform Modules

Terraform modules are self-contained packages of Terraform configuration that encapsulate resources and their config. This allows developers to easily reuse infrastructure configuration across different projects without the need to repeatedly write similar IaC for each project.

Benefits of using modules include:

- Modularity
- Reusability
- Abstraction
- Standardization
- Scalability

## File structure

The typical file structure for a Terraform module is:

```
.
├── README.md
├── main.tf
├── variables.tf
└── outputs.tf
```

- The `README.md` file contains documentation describing how to use the module such as an example.

- The `main.tf` file is the main set of configurations for the module, containing resource blocks and definitions.

- The `variables.tf` file contains all the values that need to be passed to this module which will be configured as arguments in the resource blocks of the `main.tf` file. Any variables that not given a default value will be a required argument, otherwise they are optional.

- The `outputs.tf` file is an optional file that contains any values that should be exported to be used as input for other assets.

## Understanding how modules work

To use a module, you reference it within your Terraform configuration files using its source location, which can be a local file path `eg. modules/aws-s3-static-website-bucket`, or a remote URL pointing to a versioned module repository `eg. terraform-aws-modules/s3-bucket/aws`.

You can then instantiate the module multiple times with different input variables to customize its behavior for specific use cases or environments. Modules can be shared within an organization, publicly on platforms like the Terraform Registry, or privately within a version control system.

For a visual diagram of how a module works, refer to [Terraform module diagram](https://miro.com/app/board/uXjVKe7vFx0=/?share_link_id=929555813567).

## Making your own local Terraform module

Now we are going to turn what we just made into a Terraform module. The module should deploy all the resources required for a static website bucket without the need to manually code them out. We should only need to provide the module the required variables and it should do the rest.

1. Create the required files - `main.tf` and `variables.tf` inside `modules/aws-s3-static-website-bucket`
2. Add the required resources needed for a static website bucket in `main.tf`. (Hint: refer to `s3_bucket.tf`)
3. Declare variables in `variables.tf` and add them to `main.tf` as arguments
4. Create a new `.tf` file in the root directory to use the new module
5. Instantiate the module with variables
