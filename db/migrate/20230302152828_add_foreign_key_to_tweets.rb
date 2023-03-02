class AddForeignKeyToTweets < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :tweets, :users, column: :user_id
    add_foreign_key :tweets, :users, column: :user_id, on_update: :cascade
  end
end
