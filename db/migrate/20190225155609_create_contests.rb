class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :title
      t.text :description
      t.string :status, default: "opened"
      t.integer :creator_id, index: true
      t.integer :coins_init
      t.string :category
      t.integer :players_nb
      t.string :code

      t.timestamps
    end

    add_foreign_key :contests, :users, column: :creator_id
  end
end
