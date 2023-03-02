class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, persist: true
      t.integer :followed_id, persist: true
      t.timestamps
    end
  end
end
