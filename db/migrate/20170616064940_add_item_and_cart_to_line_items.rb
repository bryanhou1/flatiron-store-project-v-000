class AddItemAndCartToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :item, index: true
    add_foreign_key :line_items, :items
    add_reference :line_items, :cart, index: true
    add_foreign_key :line_items, :carts
  end
end
