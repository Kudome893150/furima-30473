class PurchasesController < ApplicationController
  before_action :choise_item, only: [:index, :create, :pay_item]
  before_action :authenticate_user!

  def index
    if @item.purchase || (user_signed_in? && current_user.id == @item.user_id)
      redirect_to root_path
    else
      @purchase = PurchaseForm.new
    end
 end

  def create
    @purchase = PurchaseForm.new(purchase_params) 
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:post_code,:prefecture_id, :city, :house_num, :building_name, :phone_num).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])  
  end

  def choise_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: purchase_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
 end
end
