class Image < ApplicationRecord
  belongs_to :tweet
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
