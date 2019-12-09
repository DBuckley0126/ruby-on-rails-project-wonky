class CreateFarmers < ActiveRecord::Migration[6.0]
  def change
    create_table :farmers do |t|
      t.string :name, null: false
      t.string :email, index: true, null: false, unique: true
      t.string :password_digest, null: false
      t.string :image
      t.string :uid
      t.string :farm_name, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.text :description, null: false
      t.boolean :organic_certification, null: false

      t.timestamps
    end
  end
end
