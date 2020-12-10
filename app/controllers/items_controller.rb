class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at ASC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy # (出品者が)削除が成功したらトップに戻る
      redirect_to root_path
    else             # (出品者が)削除が失敗したらトップに戻る
      redirect_to root_path             # (if @item.destroyの分岐のend)
    end               # (ログイン分岐のend)
      redirect_to root_path unless current_user.id == @item.user_id
  end                # (出品でない者が)アクションを起こしたらトップに戻る
                     # (出品者判別の分岐の下に記述することで、出品者ではない場合の処理になる)

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, :user_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user.id && @item.order.nil?
  end

end
