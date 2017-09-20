class StoreController < ApplicationController
	before_action :authenticate_user!, except: [:index]
  def index
  	@categories = Category.all
  	@items = Item.all
  end
end
