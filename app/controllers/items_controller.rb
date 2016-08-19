class ItemsController < ApplicationController

  def index
    @selections = Selection.where(owner_hash: session[:selection_owner_hash])
    @categories = Item.group_by_category(Item.all.to_a - @selections.to_a.map(&:item))

    @tip_selected = ((params[:tip].to_f - 1) * 100).round(0) if params[:tip]
    @total = Selection.calculate_sum(@selections) * (params[:tip] ? params[:tip].to_f : 1)
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
    params[:item][:special_date] = params[:item][:special_date].to_i if params[:item][:special_date].present?
    params.require(:item).permit(:name, :description, :category, :price, :special_date)
  end

end
