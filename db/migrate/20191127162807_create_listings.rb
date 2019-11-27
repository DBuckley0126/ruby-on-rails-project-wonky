class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :measurement
      t.float :price
      t.integer :farmer_id
      t.integer :category_id
      t.boolean :organic

      t.timestamps
    end
  end
end
