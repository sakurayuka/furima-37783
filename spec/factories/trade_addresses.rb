FactoryBot.define do
  factory :trade_address do
    token { ["000000000000000000"] }
    post_code { '123-4567' }
    pref_id { 2 }
    city_name { '東京都' }
    building_name{ 'ビル' }
    house_number { '1-1' }
    phone_number { '00000000000' }
  end
end
