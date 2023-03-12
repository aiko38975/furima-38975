FactoryBot.define do
  factory :item do
    name               { 'あい愛アイ' }
    description        { 'あい愛アイ' }
    category_id        { '2' }
    condition_id       { '3' }
    shipping_fee_id    { '2' }
    shipping_pref_id   { '2' }
    shipping_date_id   { '2' }
    price              { '7000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
