class ItemsController < ApplicationController

	def index
		@items = Item.all
	end
	
	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_create_params)
		@item.save ? redirect_and_flash(items_path, :success, "Item Created!") : render("new") 
	end

	private

	def item_create_params
		params.require(:item).permit(:name, :description, :category, :price)
	end
end
