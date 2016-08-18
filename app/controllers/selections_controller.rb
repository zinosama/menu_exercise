class SelectionsController < ApplicationController
	before_action :valid_item, only: [:create]
	before_action :valid_selection, only: [:destroy]

	def create
		session[:selection_owner_hash] ||= Selection.generate_owner_hash
		Selection.find_or_create_by(owner_hash: session[:selection_owner_hash], item_id: @item.id)
		redirect_and_flash(root_path, :success, "Item added.")
	rescue
		redirect_and_flash(root_path, :error, "Error!")
	end

	def destroy
		@selection.destroy
		redirect_and_flash(root_path, :success, "Selection removed!")
	end	

	private

		def valid_item
			@item = Item.find(params[:item_id])
			redirect_and_flash(root_path, :error, "Item currently not available!") unless @item.currently_available?
		rescue ActiveRecord::RecordNotFound
			redirect_and_flash(root_path, :error, "Invalid item!")
		end

		def valid_selection
			@selection = Selection.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_and_flash(root_path, :error, "Invalid selection!")
		end
end
