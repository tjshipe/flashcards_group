class AddCountsToCards < ActiveRecord::Migration
  def change
  	change_table :cards do |t|
  		t.integer :lifetime_correct
  		t.integer :lifetime_incorrect

  		t.integer :session_correct
  		t.integer :session_incorrect
  	end
  end
end
