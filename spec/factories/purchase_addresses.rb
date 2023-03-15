FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    shipping_pref_id { 1 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09090009000' }

  end
end
