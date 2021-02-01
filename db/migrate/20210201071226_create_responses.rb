class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :body
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
