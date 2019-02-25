class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :contest, foreign_key: true
      t.string :name
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
