class LineItemsController < ApplicationController
	def create
		#generating a cart for the user if it doesn't exist yet
		current_user.current_cart = Cart.create(user_id: current_user.id) if !current_user.current_cart

    @cart = current_user.current_cart
    @cart.add_item(params[:item_id]).save
 
    # #look for items to stack
    # if @cart.line_items.find_by(item_id: params[:item_id])

    # 	existing_item = @cart.line_items.find_by(item_id:params[:item_id])
    #   existing_item.quantity += 1
    #   existing_item.save
    # else
    # 	#maybe should add quantity default to model instead
    #   LineItem.create(quantity: 1, item_id: params[:item_id], cart_id:@cart.id)
    # end

    current_user.save
    redirect_to cart_path(@cart)
	end
end
