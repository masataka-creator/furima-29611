class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index  # indexアクションを定義した
    @item = 'これはコントローラーで定義したインスタンス変数を確認するための文字列です'
  end

  def def new
    @item = Item.new
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
