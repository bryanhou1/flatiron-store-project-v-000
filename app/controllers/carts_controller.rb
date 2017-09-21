class CartsController < ApplicationController
	

	def show
		@cart = Cart.find(params[:id])

		# consider adding a msg
		redirect_to store_path unless current_user.id == @cart.user_id && @cart.user_id
	end

	def checkout
		@checkout_cart = current_user.current_cart
		@checkout_cart.checkout


		current_user.current_cart = nil
		current_user.save

		redirect_to cart_path(@checkout_cart)
	end
end
