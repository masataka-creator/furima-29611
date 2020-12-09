FactoryBot.define do
  factory :user_order do
    phone_num     { 123-4567 }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { '東京都' }
    home_number   { '千代田区' }
    building_name { 'テックキャンプハウス' }
    telephone     { 11111111111 }
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       { '' }
    item_id       { '' } 
    
  end
end
