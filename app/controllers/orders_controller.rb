class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item
  before_action :move_to_index

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def user_order_params
    params.require(:user_order).permit(:phone_num, :prefecture_id, :city, :home_number, :building_name, :telephone).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: user_order_params[:price],  # 商品の値段
        card: user_order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.order != nil
  end

end