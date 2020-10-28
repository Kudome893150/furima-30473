class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :item_method, only:[:show, :edit, :update, :destroy]

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
    if user_signed_in?
      if @item.purchase
       redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
     unless current_user == @item.user
       redirect_to root_path
     end
  end

  def update 
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit
      end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
     render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:comment, :category_id, :condition_id, :name, :charge_id, :area_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_method
    @item = Item.find(params[:id])
  end

end
