class ChangeDefaultOfStatusInGames < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:games, :status, 'pending')
  end
end