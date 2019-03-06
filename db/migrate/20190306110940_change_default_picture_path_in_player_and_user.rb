class ChangeDefaultPicturePathInPlayerAndUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:players, :picture_path, 'players/default.jpg')
    change_column_default(:users, :picture_path, 'users/default.jpg')
  end
end
