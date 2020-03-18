class TweetsController < ApplicationController
  def new
    @tweet =Tweet.new
    3.times{@tweet.images.build}
  end

  def create
    @tweet = Tweet.create(tweet_params)
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
    @first_image = Image.find_by(tweet_id: @tweets.id)
    @images = Image.where(tweet_id: @tweets.id)
  end
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to root_path,notice: "削除しました"
    else
      redirect_to root_path,notice: "削除に失敗しました"
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body,images_attributes:[:image])
    end
end
