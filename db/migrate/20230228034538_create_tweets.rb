class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
    end
  end
end
