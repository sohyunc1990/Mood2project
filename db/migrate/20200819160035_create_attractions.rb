class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :destination_id
      t.string :image
      t.string :description
    end
  end
end
