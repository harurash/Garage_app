class Image < ApplicationRecord
  belongs_to :tweet,dependent: :destroy
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
