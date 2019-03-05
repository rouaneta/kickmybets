class AddOddsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :odds_choice_one, :float
    add_column :games, :odds_choice_two, :float
  end
end
