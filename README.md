# README
# Garage App
GarageAppは車の情報をシェア出来る投稿アプリです。写真の複数投稿、人気の投稿記事ランキング、プロフィール編集機能などが可能です。
# 使用技術
・ruby 2.5.1
・rails 5.2.4.1
・HTML
・SCSS
・jQuery
・MY SQL
・AWS
# demo
以下にアクセスし、ご覧ください。 http://18.177.15.150/
# DB設計
## tweetテーブル
|column|type|options|
|------|----|-------|
|body|text||
|user_id|integer||
### association
・belongs_to :user
・has_many :images
・has_many :favorites,dependent: :destroy
・has_many :favorite_tweets, through::favorites, source: :user
## imageテーブル
|column|type|options|
|------|----|-------|
### association
belongs_to :tweet
## userテーブル
|column|type|options|
|------|----|-------|
|name|string|ull: false, default: ""|
|email|string|ull: false, default: ""|
|encrypted_password|string|default: ""|
|image|text||
### association
・devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]
・has_many :sns_credentials
・has_many :tweets
・has_many :favorites
・has_many :favorite_tweets, through: :favorites, source: :tweet
## favoriteテーブル
|column|type|options|
|------|----|-------|
|user_id|integer||
|tweet_id|integer||
### association
・belongs_to :tweet
・belongs_to :user
## sns_credentialsテーブル
|column|type|options|
|------|----|-------|
|provider|string||
|uid|string||
|user|references|foreign_key: true|
### association
・belongs_to :user, optional: true