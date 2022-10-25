# Create the SageMaker notebook instance
resource "aws_sagemaker_notebook_instance" "shuri_notebook_instance" {
  name = "nova-sagemaker-notebook-instance"
  role_arn = aws_iam_role.notebook_iam_role.arn
  instance_type = "ml.t2.medium"
  subnet_id = var.subnet_id
  direct_internet_access = "Disabled" /// Should be disabled to reach the storage
  default_code_repository = aws_sagemaker_code_repository.code_repository.code_repository_name
  security_groups = [var.security_groups] 

  tags = {
    Name = "Nova SageMaker"
    Environment = "Dev/Test"
  }
}