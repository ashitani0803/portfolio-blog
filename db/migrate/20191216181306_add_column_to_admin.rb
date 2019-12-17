class AddColumnToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :name, :string
    add_column :admins, :image_id, :string
    add_column :admins, :profile, :text
  end
end
