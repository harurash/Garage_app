class ImagesController < ApplicationController
  def create
    @image = @tweet.images.new(image_params)
  end

  private
  def image_params
    params.require(:image).permit({images: []})
  end
end
