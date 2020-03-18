module TweetsHelper
  def new_image(tweet)
    @new_image = Image.find_by(tweet_id: tweet.id)
  end

  def sub_image(tweet)
    @sub_image = Image.where(tweet_id: tweet.id)
  end
  def search_image(tweet)
    @rank_image = Image.find_by(tweet_id: tweet.id)
  end
end
