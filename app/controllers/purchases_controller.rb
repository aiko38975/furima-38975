class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    # if @purchase_address.valid?
      # @purchase_address.save
      # redirect_to root_path
    # else
      # render :new  #new？？？？
    # end
  end

  private

  def purchase_params  #mergeはuerだけ？itemは？
    params.require(:purchase_address).permit(:postal_code, :shipping_pref_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id)
  end
end
