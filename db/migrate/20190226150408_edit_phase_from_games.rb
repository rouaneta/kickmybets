class EditPhaseFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column(:games, :phase)
    add_column :games, :phase, :integer
  end
end
