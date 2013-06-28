class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :front
      t.string :back
      t.integer :deck_id
      t.timestamps
    end
  end
end
