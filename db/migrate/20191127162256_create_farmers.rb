class CreateFarmers < ActiveRecord::Migration[6.0]
  def change
    create_table :farmers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :image
      t.string :uid
      t.string :farm_name
      t.string :location
      t.text :description
      t.boolean :organis_certification

      t.timestamps
    end
  end
end
