class CreateLineItems < ActiveRecord::Migration
  def change
  	create_table :line_items do |t|
  		t.integer :quantity, default: 1
  	end
  end
end
