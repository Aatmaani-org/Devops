# Creating ECR using Terraform:
/*
variable "repository_name" {
  type        = string
  description = "nodejs-repository-dev"
  default = "nodejs-repository-dev"
}

variable "attach_lifecycle_policy" {
  default     = false
  type        = bool
  description = "If true, an ECR lifecycle policy will be attached"
}

variable "lifecycle_policy" {
  default     = ""
  type        = string
  description = "Contents of the ECR lifecycle policy"
}

# ECR

resource "aws_ecr_repository" "node-app-dev" {
  name = var.repository_name

}

resource "aws_ecr_lifecycle_policy" "node-app-dev" {
  count = var.attach_lifecycle_policy ? 1 : 0

  repository = aws_ecr_repository.node-app-dev.name
  policy     = var.lifecycle_policy != "" ? var.lifecycle_policy : file("${path.module}/templates/default-lifecycle-policy.json.tpl")
}
*/
