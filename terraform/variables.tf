# TFC Configuration
# https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/aws-configuration
variable "tfc_aws_dynamic_credentials" {
  description = "Object containing AWS dynamic credentials configuration"
  type = object({
    default = object({
      shared_config_file = string
    })
    aliases = map(object({
      shared_config_file = string
    }))
  })
  default = null
}

variable "tfc_terraform_token" {
  type        = string
  description = "HCP Terraform token"
}

variable "tfc_terraform_org_name" {
  type        = string
  description = "HCP Terraform orgnization name"
}

variable "tfc_terraform_project_name" {
  type        = string
  description = "HCP Terraform project name"
  default     = "aft"
}

# AWS Configuration
variable "aws_region_name" {
  type        = string
  description = "AWS region name"
  default     = "ap-northeast-1"
}

variable "ct_management_account_id" {
  type        = string
  description = "AWS account ID (Control Tower management)"
}

variable "log_archive_account_id" {
  type        = string
  description = "AWS account ID (Log archive)"
}

variable "audit_account_id" {
  type        = string
  description = "AWS account ID (Audit)"
}

variable "aft_management_account_id" {
  type        = string
  description = "AWS account ID (AFT management)"
}

# GitHub Configuration
variable "github_org_name" {
  type        = string
  description = "GitHub orgnization name"
}
