class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_pref_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true

  belongs_to : user
end
