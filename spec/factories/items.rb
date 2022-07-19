FactoryBot.define do
  factory :item do
    item_name          {"商品名"}
    price              {1234567}
    explanation        {Faker::Lorem.sentence}
    category_id        {2}
    condition_id       {2}
    postage_status_id  {2}
    pref_id            {2}
    day_to_ship_id     {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end    
  end
end