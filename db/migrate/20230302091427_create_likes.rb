class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, presence: true
      t.references :tweet, presence: true
    end
  end
end
