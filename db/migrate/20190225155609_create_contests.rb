class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :user, foreign_key: true
      t.integer :coins_init
      t.string :type
      t.integer :players_nb
      t.string :code

      t.timestamps
    end
  end
end
