class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :update]
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.all
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def edit
    return
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:item_images, :name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, :user)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
