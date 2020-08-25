class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :attraction_id
      t.integer :user_id
      t.string :title
      t.integer :rating
      t.string :comments
    end
  end
end
