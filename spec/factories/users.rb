FactoryBot.define do
  factory :user do
    nickname               { 'テスト' }
    email                  { 'test@example' }
    password               { '1111ww' }
    password_confirmation  { password }
    first_name             { '太郎' }
    last_name              { '山田' }
    first_name_reading     { 'タロウ' }
    last_name_reading      { 'ヤマダ' }
    birthday               { '2000-01-01' }
  end
end
