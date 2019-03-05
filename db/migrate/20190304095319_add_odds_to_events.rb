class AddOddsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :odds_choice_one, :float
    add_column :events, :odds_choice_two, :float
  end
end
