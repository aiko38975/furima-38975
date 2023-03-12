class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true,
                          numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true,
                           numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, presence: true,
                              numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_pref_id, presence: true,
                               numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, presence: true,
                               numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_pref
  belongs_to :shipping_date
end
