## Fire ノート 🚒

<img width="1424" alt="スクリーンショット 2020-06-05 00 05 30" src="https://user-images.githubusercontent.com/50512657/83774548-c8bd4400-a6c0-11ea-9637-3f6073582438.png">

Fire ノートは、**消防職員が災害現場で経験したことを記事にして、共有できるサービス**です。✨

- 個人の経験値には限りがあり、多様化する災害現場においてはこれが弱みになるため、それぞれのユーザーが経験したことを共有して、この課題を解決したい。という想いから現役の消防職員向けに作りました。

- 消防職員間で経験を共有することにより、次に自分が遭遇した災害現場で活かすことができ、経験の少ない若手職員の育成に役立てられます。

- 記事の投稿を KPT 方式のフォーマットにして、経験したことのふりかえりができるように工夫しました。

## URL

- AWS：
  https://www.fire-note.com/

- Heroku：
  https://fire-note.herokuapp.com/

## 技術スタック

### 言語・フレームワーク

- Ruby 2.5.8
- Rails 5.2.4

### 開発環境

- docker
- MySQL

### テスト環境

- RSpec
- CircleCI(自動テスト)

### 本番環境

- AWS (EC2・RDS・S3・ACM・Route53)
- Unicorn
- Nginx

## 機能一覧

- 新規登録／ログイン機能
- 簡単ログイン機能
- 記事の投稿・一覧表示・編集・削除
- 記事検索機能
- ソート機能（いいね順に記事を表示）
- タイムライン(フォローしたユーザーが投稿した記事一覧を表示)
- 画像アップロード(ユーザーのプロフィール)
- ページネーション機能
- コメント機能
- いいね機能(Ajax)
- ストック機能(Ajax)
- フォロー/フォロワー機能(Ajax)
- テスト(RSpec)

## 設計

### 要件定義書

https://quip.com/FQbQAZSN8x8j

### テーブル設計(ER 図)

<img width="869" alt="スクリーンショット 2020-06-05 11 41 13" src="https://user-images.githubusercontent.com/50512657/83831419-52512e00-a722-11ea-94fb-9bb7cca482cf.png">

## その他

- レスポンシブ未対応(今後、実装予定)

## 環境構築

### EICHAN1208/fire-note リポジトリを あなたのリポジトリに Fork して、git clone してください。

### docker コンテナをビルド

```
$ docker-compose build
```

### gem のインストール

```
$ docker-compose run web gem install bundler
$ docker-compose run web bundle install
```

### パッケージのインストール

```
$ docker-compose run web yarn install
```

### データベースの作成

```
$ docker-compose run web bundle exec rails db:create
$ docker-compose run web bundle exec rails db:migrate
$ docker-compose run web bundle exec rails db:seed
```

### docker の起動

```
$ docker-compose up
```

### localhost:3000 にアクセス
