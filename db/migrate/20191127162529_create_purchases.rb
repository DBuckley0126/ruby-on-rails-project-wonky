class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :listing_id, null: false
      t.integer :user_id, null: false
      t.float :amount, null: false
      t.string :measurement, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
