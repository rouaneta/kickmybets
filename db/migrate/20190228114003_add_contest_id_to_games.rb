class AddContestIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :contest, index: true
  end
end
