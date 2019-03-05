class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :resource, polymorphic: true, index: true
      t.references :participation, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
