class Image < ApplicationRecord
  belongs_to :tweet
  validates :tweet, presence: true
  mount_uploader :tweet, ImagesUploader
  serialize :images, JSON
end
