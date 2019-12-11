class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, index: true, null: false, unique: true
      t.string :password_digest
      t.string :image
      t.string :uid
      t.string :address, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
