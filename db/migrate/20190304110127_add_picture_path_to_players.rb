class AddPicturePathToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :picture_path, :string
  end
end
