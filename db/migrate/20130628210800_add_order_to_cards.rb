class AddOrderToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :order_num
    end
  end
end
