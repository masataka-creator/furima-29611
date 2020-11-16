FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { Faker::Internet.password(min_length: 6) }
    first_name            { Faker::Name.initials(number: 4) }
    last_name             { Faker::Name.initials(number: 4) }
    first_name_kana       { Faker::Name.initials(number: 4) }
    last_name_kana        { Faker::Name.initials(number: 4) }
    birthdate { '2000-01-01' }
  end
end
