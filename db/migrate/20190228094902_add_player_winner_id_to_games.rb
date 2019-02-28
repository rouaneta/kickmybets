class AddPlayerWinnerIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :player_winner_id, :integer
    add_index :games, :player_winner_id
    add_foreign_key :games, :players, column: :player_winner_id
  end
end
