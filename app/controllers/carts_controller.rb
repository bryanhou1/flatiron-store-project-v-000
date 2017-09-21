class CartsController < ApplicationController
	#auth needed?

	def show
		@cart = Cart.find(params[:id])
	end

	def checkout
		@checkout_cart = current_user.current_cart
		@checkout_cart.checkout


		current_user.current_cart = nil
		current_user.save

		redirect_to cart_path(@checkout_cart)
	end
end
