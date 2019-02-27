class AddGameCodeToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_code, :string
  end
end
