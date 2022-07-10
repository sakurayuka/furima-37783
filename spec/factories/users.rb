FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"川田"}
    last_name             {"カワウソ"}
    kana_first_name       {"カワタ"}
    kana_last_name        {"カワウソ"}
    birthday              {Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end