# README

## Golfer

ゴルフ場のレビューが行えるサイトです。

https://www.golf-review-app.com/ 
※現在インスタンス停止中です。

トップ画面からゲストユーザーでログインが可能です。

## 主な機能,使用gemなど

- ユーザー登録機能(device)
- ユーザー間でのフォロー、フォロワー機能(ajax)
- レビュー、コメント機能(CRUD)
- 画像投稿機能(carrierwave)
- いいね機能(ajax)
- 検索機能(ransack)
- 管理人機能(ユーザー,投稿削除権限)
- ゲストユーザーログイン機能
- ページネーション機能
- おすすめ機能
- 静的解析ツール(rubocop)
- 単体テスト,統合テスト(minitest)

## 使用技術

- Ruby 2.6.3
- Rails 6.0.2
- MYSQL 8.0
- nginx 1.12
- GitHub,Git
- Docker(開発環境)
- AWS(IAM,VPC,EC2,RDS,ALB,ACM,Route53)
