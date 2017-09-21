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
end