# アプリ名: NightWalk
## 🌐 App URL

### **https://nightwalk-pf2.herokuapp.com/**  

## :octocat: テスト用アカウント
### email: test@com
### password: 11111111

## 📦 Features
### ホラー・オカルト大好きなあなたの為のサイトです。
### Topページ
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.21.09.png" width=80%>
</p>

### about
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.21.18.png" width=80%>
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.21.26.png" width=80%>
</p>

### 作成された掲示板一覧が表示されます
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-10-01 12.28.12.png" width=80%>
</p>

### 掲示板の投稿内容を見れます（ROM専）
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-10-01 12.28.21.png" width=80%>
</p>

### 掲示板の投稿内容を見ることができ、積極的な、意見・質問の投稿ができます
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-10-01 12.28.28.png" width=80%>
</p>

### ユーザー情報（名前・メールアドレス・画像）の編集ができます
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.21.56.png" width=80%>
</p>

### オススメホラー映画の情報を投稿しましょう
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.40.50.png" width=80%>
</p>

### 投稿された映画の詳細紹介ページです
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.22.58.png" width=80%>
</p>

### 映画の紹介ページには「みんなの声」としてレビューが表示されます。
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.23.10.png" width=80%>
</p>

### 掲示板・映画で気になる場所があったら経路を検索して出発しましょう
<p align="center">
  <img src="/public/README-images/スクリーンショット 2020-09-30 13.50.09.png" width=80%>
</p>

## 制作背景
### 私はホラーが大好きです。
### インターネットでホラー映画を検索したり
### youtubeで心霊スポット凸動画を検索したり
### 2chで洒落怖を読んだりしています。
### これ一つのサイトで情報収集できたらいいなーと考え
### 作ってみました。
### 良いナイトライフを・・・

## 実装予定
### チャットの自動更新機能実装
### 各所のユーザーアイコンからユーザー詳細ページへリンク
### ユーザーごとのアクセス権限

# DB設計
## gossipテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|presence: true|

### Association
- has_many :group_users
- has_many :users, through: :group_users
- has_many :chats

## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|image|string|null: false|

### Association
- has_many :gossip_users
- has_many :gossips, through: :group_users 
- has_many :chats
- has_many :comments
- has_many :movies

## gossip_usersテーブル
|Column|Type|Options|
|------|----|-------|
|gossip_id|interger|foreign_key: true|
|user_id|interger|foreign_key: true|

### Association
- belongs_to :gossip
- belongs_to :user

## chatテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|presence: true, unless: :image?|
|image|string| |
|gossip_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :gossip
- belongs_to :user

## movieテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|presence: true|
|summary|string| |
|director|string| |
|original|string| |
|actor|string| |
|image|string| |
|user_id|string|foreign_key: true|

### Association
- belongs_to :user
- has_many :comments


## commentテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|presence: true|
|movie_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :movie