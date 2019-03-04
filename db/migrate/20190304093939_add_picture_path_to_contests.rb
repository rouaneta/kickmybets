class AddPicturePathToContests < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :picture_path, :string
  end
end
