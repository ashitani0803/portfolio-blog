class CreateTagMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_maps do |t|
      t.integer :blog_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
