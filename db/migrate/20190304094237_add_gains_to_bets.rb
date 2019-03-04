class AddGainsToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :gains, :float
  end
end
