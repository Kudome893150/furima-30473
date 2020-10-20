FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '田中' }
    last_name             { '太郎' }
    first_name_kana       { 'タナカ' }
    last_name_kana        { 'タロウ' }
    birth_date            { Faker::Date.between(from: '1900-01-01', to: '2020-10-20') }
  end
end
