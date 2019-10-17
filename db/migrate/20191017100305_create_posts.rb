class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tag
      t.text :image_id
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
