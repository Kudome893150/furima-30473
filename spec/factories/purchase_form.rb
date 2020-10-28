FactoryBot.define do
  factory :purchase_form do
    token { Faker::Lorem.characters(16) }
    post_code { '123-4567' }
    prefecture_id { 10 }
    city { '墨田区' }
    house_num { '1-1' }
    building_name { 'アサヒ第一ビル' }
    phone_num { Faker::Number.number(digits: 11) }
  end
end