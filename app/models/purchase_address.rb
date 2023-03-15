class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_pref_id, :city, :street, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_pref_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_pref_id: shipping_pref_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase_id )
  end
end