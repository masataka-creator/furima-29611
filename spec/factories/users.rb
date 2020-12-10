FactoryBot.define do
  factory :user do
    nickname              { 'abc' }
    email                 { 'test@test.com' }
    password              { 'test01' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthdate             { '2000-01-01' }
  end
end
