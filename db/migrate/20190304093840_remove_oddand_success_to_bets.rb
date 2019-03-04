class RemoveOddandSuccessToBets < ActiveRecord::Migration[5.2]
  def change
    remove_column :bets, :odds
    remove_column :bets, :success
  end
end
