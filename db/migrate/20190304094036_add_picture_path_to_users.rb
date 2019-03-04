class AddPicturePathToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :picture_path, :string
  end
end
