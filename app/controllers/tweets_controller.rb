class TweetsController < ApplicationController
 
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def show
    @tweets = Tweet.find(params[:id])
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
