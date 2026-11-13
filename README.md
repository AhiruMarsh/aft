# AFT
AWS Control Tower Account Factory for Terraform (AFT) を用いて、AWSアカウントのプロビジョニングおよびアカウントカスタマイズを自動化するためのTerraformコードを管理するリポジトリです。

## 構成
- [terraform/](terraform/) : AFTをデプロイするためのTerraformコード一式
  - [terraform/README.md](terraform/README.md) : `terraform-docs` によって自動生成されたモジュールのドキュメント  
  `.github/workflows/documentation.yml` によりPR時に自動更新されます。

## カスタマイズしたAFTモジュールについて
本リポジトリでは、[aws-ia/terraform-aws-control_tower_account_factory](https://github.com/aws-ia/terraform-aws-control_tower_account_factory) をベースにカスタマイズした以下のフォークモジュールを利用しています。  
モジュールをバージョンアップする際は、`main.tf` の `ref` を更新してください。

- リポジトリ: https://github.com/AhiruMarsh/terraform-aws-control_tower_account_factory
- 参照コミット: [`5f350c649f31aeb43dca7798d27ab7d070e6e7f7`](https://github.com/AhiruMarsh/terraform-aws-control_tower_account_factory/commit/5f350c649f31aeb43dca7798d27ab7d070e6e7f7)
- 利用箇所: [terraform/main.tf](terraform/main.tf) の `module "aft"` ブロック

### カスタマイズ内容
| ファイル | 変更内容 |
|---|---|
| `modules/aft-account-request-framework/eventbridge.tf` | アカウントリクエストプロセッサ（`aws_cloudwatch_event_rule.aft_account_request_processor`）のスケジュール実行間隔を、本家の5分ごと（`rate(5 minutes)`）から1時間ごと（`rate(1 hour)`）に変更 |

## アカウント発行方式
`terraform/main.tf` で `account_vending_method = "organizations"` を指定しており、アカウントは Service Catalog (Control Tower Account Factory) ではなく AWS Organizations の `CreateAccount` で作成し、Control Tower の自動登録 (auto-enrollment) でエンロールします。

- 前提: Control Tower の landing zone が `ACTIVE` で自動登録が有効であること、申請する OU (`ManagedOrganizationalUnit`) が Control Tower に登録済みであること。
- アカウントリクエストの `SSOUser*` は使用されません（IAM Identity Center の割り当ては別途実施）。
- `aft_feature_delete_vended_account_default_vpcs_enabled = true` により、新規アカウントのデフォルトVPCは作成直後に削除されます。
