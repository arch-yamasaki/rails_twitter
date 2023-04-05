class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # tweets
  has_many :tweets

  # likes
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  # follow関係
  has_many :follows, class_name: "Follow", foreign_key: "following_id", dependent: :destroy
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :follows, source: :followed # 自分をfollowしてる人たち
  has_many :followers, through: :reverse_of_follows, source: :follower # 自分がfollowした人たち

  # 画像関連
  has_one_attached :profile_image

  def like?(tweet)
    like_tweet_ids().include?(tweet.id)
  end

  def follow?(user)
    following_ids.include?(user.id)
  end

  def display_profile_image
    if profile_image.attached?
      profile_image
    else
      "default_user.png"
    end
  end

end
