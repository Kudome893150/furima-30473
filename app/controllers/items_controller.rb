class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: 

  def index
    @items = Item.all.order('created_at DESC').includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:comment, :category_id, :condition_id, :name, :charge_id, :area_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
