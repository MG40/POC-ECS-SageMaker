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
resource "aws_iam_role" "notebook_iam_role" {
  name = "nova-sagemaker-notebook-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# Attach the AWS default policy, "AmazonSageMakerFullAccess"
resource "aws_iam_policy_attachment" "full_access_attach" {
  name = "sm-full-access-attachment"
  roles = [aws_iam_role.notebook_iam_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}
