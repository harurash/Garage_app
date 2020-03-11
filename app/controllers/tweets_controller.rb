class TweetsController < ApplicationController
  def new
    @tweet =Tweet.new
    10.times{@tweet.images.build}
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path,notice: "投稿しました"
    else
      render "new"
    end
  end

  def index
    @tweets = Tweet.all
    @images = Image.all
  end

  def show
    @tweets = Tweet.find(params[:id])
    @user = @tweets.user
    @favorite_tweets = @user.favorite_tweets
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body,images_attributes:[:image])
    end
end
