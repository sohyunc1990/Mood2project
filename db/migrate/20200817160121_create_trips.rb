class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :destination_id
      t.string :departure_date
      t.string :title
      t.string :description
    end
  end
end
