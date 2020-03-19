class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :favorites,dependent: :destroy
  has_many :favorite_tweets, through: :favorites, source: :user
  validates :body, presence: true,
                   length: {maximum: 140}                  
  accepts_nested_attributes_for :images
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('body LIKE(?)', "%#{search}%")
  end
end
