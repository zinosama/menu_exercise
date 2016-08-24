class SelectionsController < ApplicationController
  before_action :valid_item, only: [:create]
  before_action :valid_selection, only: [:destroy]

  def create
    Selection.find_or_create_by(owner_hash: current_user.id, item_id: @item.id)
    redirect_to root_path, flash: { success: "Item added." }
  rescue
    redirect_to root_path, flash: { error: "Error!" }
  end

  def destroy
    @selection.destroy
    redirect_to root_path, flash: { success: "Selection removed!" }
  end 

  private
    def valid_item
      @item = Item.find(params[:item_id])
      redirect_to(root_path, flash: { error: "Item currently not available!" }) unless @item.currently_available?
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, flash: { error: "Invalid item!" }
    end

    def valid_selection
      @selection = Selection.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, flash: { error: "Invalid selection!" }
    end
end
