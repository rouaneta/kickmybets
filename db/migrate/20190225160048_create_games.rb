class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :player_one, foreign_key: {to_table: :players}
      t.references :player_two, foreign_key: {to_table: :players}
      t.integer :score_p_one
      t.integer :score_p_two
      t.integer :choice_win
      t.integer :phase, default: 1
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :status, default: "coming"

      t.timestamps
    end
  end
end
