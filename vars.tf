# These are the Hard-coded values 
# for the Nova-private subnet ID and
# default security group associated

# Subnet ID
variable "subnet_id" {
  type = string 
  description = "The VPC subnet ID"
  default = "subnet-07fa01729199095d1"
}

# Security Group ID
variable "security_groups" {
  type = string 
  description = "The Security group ID"
  default = "sg-00b4b70ca9f5adae8"
}