class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "follower_id" # followした元
  belongs_to :followed, class_name: "User", foreign_key: "followed_id" # followされた側
end
