FactoryBot.define do
  factory :user_order do
    phone_num     { '123-4567' } # ''で括ること！出ないと引き算
    prefecture_id { 2 }
    city          { '東京都' }
    home_number   { '千代田区' }
    building_name { 'テックキャンプハウス' }
    telephone     { 11_111_111_111 }
    token         { 'tok_abcdefghijk00000000000000000' }
    user_id       { 11 }
    item_id       { 11 }
  end
end
