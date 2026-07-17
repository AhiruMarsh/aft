# https://github.com/aws-ia/terraform-aws-control_tower_account_factory/blob/main/README.md
module "aft" {
  source  = "aws-ia/control_tower_account_factory/aws"
  version = "1.21.1"

  ct_management_account_id  = var.ct_management_account_id
  log_archive_account_id    = var.log_archive_account_id
  audit_account_id          = var.audit_account_id
  aft_management_account_id = var.aft_management_account_id

  ct_home_region              = var.aws_region_name
  tf_backend_secondary_region = "us-east-1"

  # VCS Vars
  vcs_provider                                  = "github"
  account_request_repo_name                     = "${var.github_org_name}/aft-account-request"
  global_customizations_repo_name               = "${var.github_org_name}/aft-global-customizations"
  account_customizations_repo_name              = "${var.github_org_name}/aft-account-customizations"
  account_provisioning_customizations_repo_name = "${var.github_org_name}/aft-account-provisioning-customizations"

  # Optional Feature Flags
  aft_feature_delete_default_vpcs_enabled = true
  aft_feature_cloudtrail_data_events      = false
  aft_feature_enterprise_support          = false
  aft_vpc_endpoints                       = false

  # Terraform Flags
  terraform_oidc_integration = true
  terraform_token            = var.tfc_terraform_token
  terraform_distribution     = "tfc"
  terraform_org_name         = var.tfc_terraform_org_name
  terraform_project_name     = var.tfc_terraform_project_name
  terraform_version          = "1.15.0"

  aft_codebuild_compute_type = "BUILD_GENERAL1_SMALL"

  # Optional Running Flags
  aft_enable_vpc = false

  cloudwatch_log_group_retention            = 7
  log_archive_bucket_object_expiration_days = 365

  backup_recovery_point_retention = 1
  backup_schedule                 = "cron(0 8 1 * ? *)" # monthly

  tags = {
    Project   = "aft"
    ManagedBy = "Terraform"
    GitRepos  = "https://github.com/AhiruMarsh/aft"
  }
}
