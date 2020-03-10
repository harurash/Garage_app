module TweetsHelper
  def new_image(tweet)
    @new_image = Image.find_by(tweet_id: tweet.id)
  end

  def sub_image(tweet)
    @sub_image = Image.find_by(tweet_id: tweet.id)
  end
end
