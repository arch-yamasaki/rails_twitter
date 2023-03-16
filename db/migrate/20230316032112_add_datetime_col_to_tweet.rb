class AddDatetimeColToTweet < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :created_at, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
