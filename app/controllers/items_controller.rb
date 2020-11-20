class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :update]

  def index  # indexアクションを定義した
    @item = Item.all
  end

  def new
    @item = Item.new  # 商品ページの新規作成なので「new」アクションを定義
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @items.update(item_params)
    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_images, :name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, :user)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
