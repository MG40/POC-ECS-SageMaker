# Refer Sagemaker code repository
resource "aws_sagemaker_code_repository" "code_repository" {
  code_repository_name = "nova-sagemaker-notebook"

  git_config {
    repository_url = "https://github.com/MG40/nova-sagemaker-notebook.git"
  }
}