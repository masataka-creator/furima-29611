class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index  # indexアクションを定義した
    @item = Item.all
  end

  def new
    @item = Item.new  # 商品ページの新規作成なので「new」アクションを定義
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:message).permit(:content, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
