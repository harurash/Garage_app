# README
## Garage App
GarageAppは車の情報をシェア出来る投稿アプリです。写真の複数投稿、人気の投稿記事ランキング、、投稿検索、プロフィール編集などが可能です。
## 使用技術
・ruby 2.5.1<br>
・rails 5.2.4.1<br>
・HTML<br>
・SCSS<br>
・jQuery<br>
・MY SQL<br>
・AWS<br>
## demo
以下にアクセスし、ご覧ください。 http://18.177.15.150/ <br>
右上"LOGINからloginできます。<br>
ご採用担当者様向けテストユーザーのアカウントをご用意していますのでそちらからログインして頂けます。<br>
## DB設計
### tweetテーブル
|column|type|options|
|------|----|-------|
|body|text||
|user_id|integer||
### association
・belongs_to :user<br>
・has_many :images<br>
・has_many :favorites,dependent: :destroy<br>
・has_many :favorite_tweets, through::favorites, source: :user<br>
### imageテーブル
|column|type|options|
|------|----|-------|
|image|string|null:false|
|tweet_id|integer|null:false|
### association
・belongs_to :tweet
### userテーブル
|column|type|options|
|------|----|-------|
|name|string|ull: false, default: ""|
|email|string|ull: false, default: ""|
|encrypted_password|string|default: ""|
|image|text||
### association
・has_many :sns_credentials<br>
・has_many :tweets<br>
・has_many :favorites<br>
・has_many :favorite_tweets, through: :favorites, source: :tweet<br>
### favoriteテーブル
|column|type|options|
|------|----|-------|
|user_id|integer||
|tweet_id|integer||
### association
・belongs_to :tweet<br>
・belongs_to :user<br>
### sns_credentialsテーブル
|column|type|options|
|------|----|-------|
|provider|string||
|uid|string||
|user|references|foreign_key: true|
### association
・belongs_to :user, optional: true