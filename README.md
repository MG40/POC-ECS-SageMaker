# Overview

This is the code to create AWS Sagemaker and its dependencies for demonstrating Hybrid Cloud. 

The notebook to run on the SageMaker is [here](https://github.com/MG40/ecs-demo-notebook).

## Pre-requisites

In order for this to run, you need to have:
- A machine with the following software:
  - git
  - git repository for the jupyter notebook
  - AWS CLI
  - Terraform
  - On the machine, you must have configured the AWS credentials that allow us to create the resources in the AWS account.
  
## Terraform code

- All the resources are created using terraform in main.tf.
- Avoid any hard-coded variables by using vars.tf

### Resources that we use:

- AWS VPC
- AWS Subnets
- AWS Security groups

### Resources that we create:

- AWS SageMaker Code Repository
- AWS IAM Role
- AWS IAM Policy attachment
- AWS SageMaker notebook instance

# How to create resources

## Run terraform code

- Set up your AWS credentials using `aws configure`.
- Check that the region is correct.
- Run the foll. in order:
  - `terraform init` to load all the modules.
  - `terraform plan` to create tfstate plan.
  - `terraform apply` and "confirm" to create resources as per the plan.

## How to destroy resources

- Terrafomr (IaC) helps us to avoid unnecessary billing.
- To destroy the resources, run 
  - `terraform destroy` and "confirm" to delete the resources.
