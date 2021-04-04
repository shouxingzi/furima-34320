FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    first_name            { '名前' }
    last_name             { '名前' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birthday              { Faker::Date.between_except(from: '1930-01-01', to: '2016-12-31', excepted: '2015-01-24') }
  end
end
