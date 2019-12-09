class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.string :measurement, null: false
      t.float :price, null: false
      t.integer :farmer_id, null: false
      t.integer :category_id, null: false
      t.boolean :organic, null: false

      t.timestamps
    end
  end
end
