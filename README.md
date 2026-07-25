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
- 参照コミット: [`10fe99952ae76fd33eb0a2808cc2ce11f6b45d17`](https://github.com/AhiruMarsh/terraform-aws-control_tower_account_factory/commit/10fe99952ae76fd33eb0a2808cc2ce11f6b45d17)
- 利用箇所: [terraform/main.tf](terraform/main.tf) の `module "aft"` ブロック

### カスタマイズ内容
| ファイル | 変更内容 |
|---|---|
| `modules/aft-account-request-framework/eventbridge.tf` | アカウントリクエストプロセッサ（`aws_cloudwatch_event_rule.aft_account_request_processor`）のスケジュール実行間隔を、本家の5分ごと（`rate(5 minutes)`）から1時間ごと（`rate(1 hour)`）に変更 |
