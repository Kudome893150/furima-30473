FactoryBot.define do
  factory :item do
    comment                          { 'テスト' }
    category_id                      { 2 }
    condition_id                     { 2 }
    name                             { 'テスト' }
    charge_id                        { 2 }
    area_id                          { 2 }
    delivery_date_id                 { 2 }
    price                            { 3000 }
    association :user
  end
end
