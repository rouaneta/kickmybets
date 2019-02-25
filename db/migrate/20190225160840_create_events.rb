class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :choice_one
      t.string :choice_two
      t.integer :choice_win
      t.references :contest, foreign_key: true

      t.timestamps
    end
  end
end
