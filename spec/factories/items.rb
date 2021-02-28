FactoryBot.define do
  factory :item do
    item_name         { 'テスト' }
    item_description  { 'データが保存されるか' }
    category_id       { 2 }
    item_condition_id { 2 }
    delivery_fee_id   { 2 }
    shipping_area_id  { 2 }
    day_to_ship_id    { 2 }
    item_price        { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
