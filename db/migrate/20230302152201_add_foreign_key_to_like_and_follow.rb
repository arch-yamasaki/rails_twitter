class AddForeignKeyToLikeAndFollow < ActiveRecord::Migration[7.0]
  def change
      add_foreign_key :likes, :users, column: :user_id, on_update: :cascade, on_delete: :cascade
      add_foreign_key :likes, :tweets, column: :tweet_id, on_update: :cascade, on_delete: :cascade
      add_foreign_key :follows, :users, column: :follower_id, on_update: :cascade, on_delete: :cascade
      add_foreign_key :follows, :users, column: :followed_id, on_update: :cascade, on_delete: :cascade
  end
end
