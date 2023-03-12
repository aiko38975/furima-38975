class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_pref_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
