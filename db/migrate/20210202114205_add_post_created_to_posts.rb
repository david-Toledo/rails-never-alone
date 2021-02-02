class AddPostCreatedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_created, :datetime
  end
end
