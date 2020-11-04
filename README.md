# README

## Golfer

ゴルフ場のレビューが行えるサイトです。<br>
トップ画面からゲストユーザーでログインが可能です。<br>

~~https://www.golf-review-app.com/~~<br>
https://golf-review-app2.herokuapp.com/
<br>
※現在はHerokuで公開中です。

## 主な機能,使用gemなど

- ユーザー登録(device)
- ユーザー間でのフォロー、フォロワー機能(ajax)
- レビュー機能(CRUD)
- 画像投稿機能(carrierwave)
- いいね機能(ajax)
- 検索機能(ransack)
- 管理人機能
- ゲストユーザーログイン機能
- 単体テスト、統合テスト(minitest)
- 静的解析ツール(rubocop)
<br>
※現在、一部機能制限中です。

## 使用技術

- Ruby 2.6.3
- Rails 6.0.2
- MYSQL 8.0
- GitHub,Git
- Docker(開発環境)
- AWS(IAM,EC2,RDS,ELB,ACM,Route53)
