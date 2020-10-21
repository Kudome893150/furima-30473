FactoryBot.define do
  factory :item do
    comment                          { 'テスト' }
    category_id                      { '2' }
    condition_id                     { '2' }
    name                             { 'テスト' }
    charge_id                        { '1' }
    area_id                          { '1' }
    delivery_date_id                 { '1' }
    price                            { '3000' }
    association :user
  end
end
