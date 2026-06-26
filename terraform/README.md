<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.52.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aft"></a> [aft](#module\_aft) | aws-ia/control_tower_account_factory/aws | 1.20.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aft_management_account_id"></a> [aft\_management\_account\_id](#input\_aft\_management\_account\_id) | AWS account ID (AFT management) | `string` | n/a | yes |
| <a name="input_audit_account_id"></a> [audit\_account\_id](#input\_audit\_account\_id) | AWS account ID (Audit) | `string` | n/a | yes |
| <a name="input_aws_region_name"></a> [aws\_region\_name](#input\_aws\_region\_name) | AWS region name | `string` | `"ap-northeast-1"` | no |
| <a name="input_ct_management_account_id"></a> [ct\_management\_account\_id](#input\_ct\_management\_account\_id) | AWS account ID (Control Tower management) | `string` | n/a | yes |
| <a name="input_github_org_name"></a> [github\_org\_name](#input\_github\_org\_name) | GitHub orgnization name | `string` | n/a | yes |
| <a name="input_log_archive_account_id"></a> [log\_archive\_account\_id](#input\_log\_archive\_account\_id) | AWS account ID (Log archive) | `string` | n/a | yes |
| <a name="input_tfc_aws_dynamic_credentials"></a> [tfc\_aws\_dynamic\_credentials](#input\_tfc\_aws\_dynamic\_credentials) | Object containing AWS dynamic credentials configuration | <pre>object({<br/>    default = object({<br/>      shared_config_file = string<br/>    })<br/>    aliases = map(object({<br/>      shared_config_file = string<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_tfc_terraform_org_name"></a> [tfc\_terraform\_org\_name](#input\_tfc\_terraform\_org\_name) | HCP Terraform orgnization name | `string` | n/a | yes |
| <a name="input_tfc_terraform_project_name"></a> [tfc\_terraform\_project\_name](#input\_tfc\_terraform\_project\_name) | HCP Terraform project name | `string` | `"aft"` | no |
| <a name="input_tfc_terraform_token"></a> [tfc\_terraform\_token](#input\_tfc\_terraform\_token) | HCP Terraform token | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->