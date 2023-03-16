class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  scope :user_following_tweets, ->(user) {includes(:user).where(user_id: user.following_ids) }
  scope :recent, -> { order(created_at: :desc) }

  def like_count
    self.like_users.length
  end
end
