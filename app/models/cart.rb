class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		total_in_cents = 0
		line_items.each { |line_item| total_in_cents += line_item.item.price * line_item.quantity }
		total_in_cents
	end

	def checkout
		line_items.each do |li|
			Item.find(li.item_id).remove_purchased_quant(li.quantity)
		end
		update(status: 'checkedout')
	end

	def add_item(item_id)
    if items.find_by(id: item_id)
      li = line_items.find_by(item_id: item_id)
      li.quantity += 1
      li
    else
			LineItem.create(quantity: 1, item_id: item_id, cart_id: self.id)
		end
	end
end