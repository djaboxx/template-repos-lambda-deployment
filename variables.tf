variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-west-2"
}

variable "environment" {
  type        = string
  description = "Environment (e.g. `prod`, `dev`, `staging`)"
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `hp` or `happypathway`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = string
  description = "Name of the application"
}

variable "template_repos" {
  type = list(object({
    name = string
    repo = string
  }))
  description = "List of template repositories to be managed"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`))"
  default     = {}
}
