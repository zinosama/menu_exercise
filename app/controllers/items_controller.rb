class ItemsController < ApplicationController
  before_action :valid_admin, only: [:new, :create]
  
  def index
    @selections = Selection.where(owner_hash: current_user.hash)
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

  def valid_admin
    redirect_and_flash(login_path, :error, "Please log in first") unless logged_in?
  end

end
