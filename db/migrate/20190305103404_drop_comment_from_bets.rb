class DropCommentFromBets < ActiveRecord::Migration[5.2]
  def change
    remove_column :bets, :comment
  end
end
