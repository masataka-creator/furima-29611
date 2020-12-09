FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 10) }
    description           { Faker::Name.initials(number: 10) }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_charge_id    { 2 }
    delivery_area_id      { 2 }
    delivery_day_id       { 2 }
    price                 { 1000 }
    user_id               { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
