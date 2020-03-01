class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.index
    @tweet.save
    redirect_to tweets_path
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
