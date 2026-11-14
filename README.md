# AFT
AWS Control Tower Account Factory for Terraform (AFT) を用いて、AWSアカウントのプロビジョニングおよびアカウントカスタマイズを自動化するためのTerraformコードを管理するリポジトリです。

## 構成
- [terraform/](terraform/) : AFTをデプロイするためのTerraformコード一式
  - [terraform/README.md](terraform/README.md) : `terraform-docs` によって自動生成されたモジュールのドキュメント  
  `.github/workflows/documentation.yml` によりPR時に自動更新されます。

## AFTモジュールについて
公式の [aws-ia/control_tower_account_factory/aws](https://registry.terraform.io/modules/aws-ia/control_tower_account_factory/aws) モジュールを Terraform Registry 経由で利用しています。  
モジュールをバージョンアップする際は、`main.tf` の `version` を更新してください(Dependabot が自動で PR を作成します)。

- 利用箇所: [terraform/main.tf](terraform/main.tf) の `module "aft"` ブロック

## アカウント発行方式
`terraform/main.tf` で `account_vending_method = "organizations"` を指定しており、アカウントは Service Catalog (Control Tower Account Factory) ではなく AWS Organizations の `CreateAccount` で作成し、Control Tower の自動登録 (auto-enrollment) でエンロールします。

- 前提: Control Tower の landing zone が `ACTIVE` で自動登録が有効であること、申請する OU (`ManagedOrganizationalUnit`) が Control Tower に登録済みであること。
- アカウントリクエストの `SSOUser*` は使用されません（IAM Identity Center の割り当ては別途実施）。
- `aft_feature_delete_vended_account_default_vpcs_enabled = true` により、新規アカウントのデフォルトVPCは作成直後に削除されます。
