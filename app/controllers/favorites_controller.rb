class FavoritesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.build(tweet_id: params[:tweet_id])
    favorite.save
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    favorite = Favorite.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    favorite.destroy
  end
end
