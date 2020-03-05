module TweetsHelper
  def find_tweet_user(tweet)
    @user = User.find_by(user_id: tweet.id)
  end
end
