FactoryBot.define do
  factory :order_address do
    postal_code       { '311-1111' }
    shipping_area_id  { 2 }
    city              { '茨城' }
    house_number      { '大洗1-1'}
    building_name     { '柳ビル' } 
    phone_number      { '09011112222' }
    token             {"tok_abcdefghijk00000000000000000"} 
  end
end
