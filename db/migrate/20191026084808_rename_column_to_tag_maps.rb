class RenameColumnToTagMaps < ActiveRecord::Migration[6.0]
  def change
		rename_column :tag_maps, :blog_id, :post_id
  end
end
