## 概要
- Nuxt.js x Railsのサンプルアプリです。RailsはAPIとして利用しています。
- ログイン後にタスク一覧/登録/編集/削除のみできます。

### API
- ユーザ認証
  - 認証時にトークンを発行する
  - トークンを保持していないとタスクAPIは利用できない

- タスク
  - 一覧
  - 登録
  - 詳細
  - 更新
  - 削除

## 環境
### Version
- Ruby v2.6.3
- Rails v5.2.3
- MySQL 5.7.22
- Nuxt.js v2.4.0
- Element v2.4.11

### アプリ初期設定
```
$ make init
```

## 起動・終了

### 起動コマンド

以下のコマンドで起動します。

```
$ make up
```

### 確認

- フロント側：http://localhost:3000/
- RailsAdmin：http://localhost:8080/admin

### 終了
Ctrl+C

## その他
### テストユーザ
- メールアドレス yamada@gmail.com
- パスワード password1