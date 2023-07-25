class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :category_id, :condition_id, :charge_id, :prefecture_id, :criterion_id, :image).merge(user_id: current_user.id)
  end

end