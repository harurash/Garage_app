module TweetsHelper
  def new_image(tweet)
    @new_image = @images.find_by(tweet_id: tweet.id)
  end
end
