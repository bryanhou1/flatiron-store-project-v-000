class CartsController < ApplicationController
	def show
		@current_cart = current_user.current_cart
	end

	def checkout
		@checkout_cart = current_user.current_cart

		redirect_to cart_path(@checkout_cart)
	end
end
