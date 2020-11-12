class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index  # indexアクションを定義した
    @item = "これはコントローラーで定義したインスタンス変数を確認するための文字列です"
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
