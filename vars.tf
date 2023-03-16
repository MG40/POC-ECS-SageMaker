# These are the Hard-coded values 
# for the Nova-private subnet ID and
# default security group associated

# Instance Type
variable "instance_type" {
  type = string
  description = "The type of the instance"
  default = "<Instance_Type>"
}

# Subnet ID
variable "subnet_id" {
  type = string 
  description = "The VPC subnet ID"
  default = "<subnet-id>"
}

# Security Group ID
variable "security_groups" {
  type = string 
  description = "The Security group ID"
  default = "<security-group>"
}
