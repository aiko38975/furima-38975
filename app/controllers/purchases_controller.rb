class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: purchase_params[:token], 
        currency: 'jpy' 
      )
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params  
    params.require(:purchase_address).permit(
      :postal_code,
      :shipping_pref_id,
      :city,
      :street,
      :building,
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
end
