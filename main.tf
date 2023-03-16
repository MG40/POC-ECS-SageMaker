### This part is done only after the completion of the following:
### - AWS Direct connect setup
### - Storage setup

# Region the resources will be created
provider "aws" {
  region = "<region>"
}

# Refer Sagemaker code repository
resource "aws_sagemaker_code_repository" "code_repository" {
  code_repository_name = "ecs-sagemaker-notebook"

  git_config {
    repository_url = "https://github.com/MG40/ecs-demo-notebook.git"
  }
}

# Define SageMaker "Assume Role" policy
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

# Create the SageMaker notebook IAM role
resource "aws_iam_role" "demo_iam_role" {
  name = "demo-iam-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# Attach the AWS default policy, "AmazonSageMakerFullAccess"
resource "aws_iam_policy_attachment" "demo_policy_attachment" {
  name = "demo-iam-policy"
  roles = [aws_iam_role.demo_iam_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}

# Create the SageMaker notebook instance
resource "aws_sagemaker_notebook_instance" "notebook_instance" {
  name = "demo-notebook-instance"
  role_arn = aws_iam_role.demo_iam_role.arn
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  direct_internet_access = "Disabled" /// Should be disabled to reach the storage
  default_code_repository = aws_sagemaker_code_repository.code_repository.code_repository_name
  security_groups = [var.security_groups]

  tags = {
    Name = "Hybrid Cloud Demo Notebook Instance"
    Environment = "Demo"
  }
}
