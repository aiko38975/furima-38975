require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code はハイフンを含んで半角数字で入力してください。")
      end
      it 'postal_codeがハイフンがないと保存できないこと' do
        @purchase_address.postal_code = '1001000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code はハイフンを含んで半角数字で入力してください。')
      end
      it 'postal_codeが全角だと保存できないこと' do
        @purchase_address.postal_code = '１００ー１０００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code はハイフンを含んで半角数字で入力してください。')
      end
      it 'shipping_pref_idが空では保存できない' do
        @purchase_address.shipping_pref_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping pref を入力してください。")
      end
      it 'shipping_pref_idが1を選択しても保存できない' do
        @purchase_address.shipping_pref_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping pref を入力してください。")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_address.phone_number = '０９０９０００９０００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁だと保存できないこと' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁だと保存できないこと' do
        @purchase_address.phone_number = '123456789111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが紐付いていなければ購入できない' do
        @purchase_address.user_id= nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていなければ購入できない' do
        @purchase_address.item_id= nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end