class RemoveTagFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :tag, :string
  end
end
