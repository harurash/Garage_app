class Image < ApplicationRecord
  belongs_to :tweet
  validates :image, presence: true
  validates :tweet, presence: true
  mount_uploader :image, ImageUploader
end
