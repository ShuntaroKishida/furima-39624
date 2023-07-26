class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :category_id, :condition_id, :charge_id, :prefecture_id, :criterion_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
