class ChangeDefaultPicturePathInContest < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:contests, :picture_path, 'contests/default.jpg')
  end
end
