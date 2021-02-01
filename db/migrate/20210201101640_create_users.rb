class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :last_name
      t.text :email
      t.text :password_digest
      t.text :image
      t.text :address
      t.float :longitude
      t.float :latitude
      t.boolean :admin
      t.boolean :user_active
      t.integer :user_type
      t.text :police_check
      t.text :national_id
      t.text :covid_safe_certifcate

      t.timestamps
    end
  end
end
