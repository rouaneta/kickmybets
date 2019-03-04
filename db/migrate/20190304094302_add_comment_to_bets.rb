class AddCommentToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :comment, :text
  end
end
