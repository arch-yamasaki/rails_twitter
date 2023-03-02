class User < ApplicationRecord
  has_many :tweets
  has_many :likes

  # follow関係
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :follows, source: :followed # 自分をfollowしてる人たち
  has_many :followers, through: :reverse_of_follows, source: :follower # 自分がfollowした人たち
end
