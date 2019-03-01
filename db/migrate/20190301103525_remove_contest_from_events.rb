class RemoveContestFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :contest_id
  end
end
