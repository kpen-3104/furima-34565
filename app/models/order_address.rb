class OrderAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :order_id, :token
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}-\d{4}\z/}         
    validates :shipping_area_id, numericality: {other_than: 1}   
    validates :city                
    validates :house_number       
    validates :phone_number,   format: {with: /\A\d+\z/}, length: { maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end
