# Creating ECR using Terraform
/*
variable "repository_name1" {
  type        = string
  description = "nodejs-repository-qa"
  default = "nodejs-repository-qa"
}

variable "attach_lifecycle_policy1" {
  default     = false
  type        = bool
  description = "If true, an ECR lifecycle policy will be attached"
}

variable "lifecycle_policy1" {
  default     = ""
  type        = string
  description = "Contents of the ECR lifecycle policy"
}

# ECR

resource "aws_ecr_repository" "node-app-qa" {
  name = var.repository_name1

}

resource "aws_ecr_lifecycle_policy" "node-app-qa" {
  count = var.attach_lifecycle_policy1 ? 1 : 0

  repository = aws_ecr_repository.node-app-qa.name
  policy     = var.lifecycle_policy1 != "" ? var.lifecycle_policy1 : file("${path.module}/templates/default-lifecycle-policy.json.tpl")
}
*/
