class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.references :resource, polymorphic: true, index: true
      t.integer :amount
      t.integer :choice
      t.float :odds
      t.references :participation, foreign_key: true
      t.boolean :success

      t.timestamps
    end
  end
end
